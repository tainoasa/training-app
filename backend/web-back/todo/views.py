from django.shortcuts import render
from rest_framework.response import Response
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
        res = requests.post('http://172.20.7.60:2150/chat',json={"text":"hello"})
        return Response(res)



