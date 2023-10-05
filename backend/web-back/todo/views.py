from django.shortcuts import render
from rest_framework.response import Response
from django.core import serializers
import json
import requests
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework import generics, viewsets
from .models import Todo, Training_history, Training_list, Recommend_history
from .serializers import TodoSerializer, Training_historySerializer, Training_listSerializer,Recommend_historySerializer,User_infoSerializer

class CsrfExemptSessionAuthentication(SessionAuthentication):
    def enforce_csrf(self, request):
        return  # To not perform the csrf check previously happening

class ListTodo(generics.ListAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

class DetailTodo(generics.RetrieveAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

class ListTraining_history(generics.ListAPIView):
    queryset = Training_history.objects.all()
    serializer_class = Training_historySerializer

class DetailTraining_history(generics.RetrieveAPIView):
    queryset = Training_history.objects.all()
    serializer_class = Training_historySerializer

class ListTraining_list(generics.ListAPIView):
    queryset = Training_list.objects.all()
    serializer_class = Training_listSerializer


class DetailTraining_list(generics.RetrieveAPIView):
    queryset = Training_list.objects.all()
    serializer_class = Training_listSerializer

class CreateTrainingHistoryView(generics.CreateAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    serializer_class = Training_historySerializer

class CreateRecommendHistoryView(generics.CreateAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    serializer_class = Recommend_historySerializer

class DummyRespponseApiView(generics.ListAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    def post(self, request, format=None):
        res = requests.post('http://172.20.7.60:2150/chat',json={"text":"野球するには何の筋トレすればいいですか？"})
        json = {"name": "DUMMY!","menu":["ベンチプレス","ペックフライ"]}
        return Response(json)

    
class ChatRespponseApiView(generics.ListAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    def post(self, request, format=None):
        data = json.loads(request.body)
        res = requests.post('http://172.20.7.60:2150/chat',json=data)
        r = json.loads(res.text)

        queryset = Training_list.objects.all()
        menu_set = serializers.serialize("json", queryset)
        menu_set = json.loads(menu_set)

        r['menu'] = []

        for i in range(len(menu_set)):
            if (r['text'].find(menu_set[i]['fields']['training_name'])>=0):
                print(menu_set[i])
                data_set = {"id":menu_set[i]['pk'],"training_name":menu_set[i]['fields']['training_name']}
                r['menu'].append(data_set)
        return Response(r)

class CalcUserExApiView(generics.ListAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    def post(self, request, format=None):
        data = json.loads(request.body)
        return 0



