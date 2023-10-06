from django.shortcuts import render
from rest_framework.response import Response
from django.core import serializers
import json
import requests
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework import generics, viewsets
from .models import Todo, Training_history, Training_list, Recommend_history,User_info
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
                data_set = {"id":menu_set[i]['pk'],"training_name":menu_set[i]['fields']['training_name']}
                r['menu'].append(data_set)

        Recommend_history.objects.create(input_txt = data['text'], recommend_name = r['menu'])
        
        return Response(r)

class CalcUserExApiView(generics.ListAPIView):
    authentication_classes = (CsrfExemptSessionAuthentication, BasicAuthentication)
    def post(self, request, format=None):
        data = json.loads(request.body)

        queryset = User_info.objects.all()
        user_info = serializers.serialize("json", queryset)
        user_info = json.loads(user_info)
        latest_info = user_info[len(user_info)-1]

        queryset1 = Training_list.objects.all()
        menu_set = serializers.serialize("json", queryset1)
        menu_set = json.loads(menu_set)
        
        for i in range(len(data)):
            for j in range(len(menu_set) ):
                if(data[i]['training_menu'] == menu_set[j]['fields']['training_name']):
                    latest_info['fields']['ex_parameter'] = latest_info['fields']['ex_parameter'] + (int(data[i]['training_weight'])*int(data[i]['training_times'])*int(data[i]['training_set'])*float(rate_of_power(str(menu_set[i]['fields']['training_parts']))))
                    print(latest_info['fields']['ex_parameter'])
                    
                    break
        while True:
            if(latest_info['fields']['ex_parameter']>=max_ex(latest_info['fields']['user_level'])):
                latest_info['fields']['ex_parameter'] = latest_info['fields']['ex_parameter'] - max_ex(latest_info['fields']['user_level'])
                latest_info['fields']['user_level'] = latest_info['fields']['user_level'] + 1
                print(latest_info['fields']['user_level'])
            else:
                break
        print(latest_info['fields']['ex_parameter'])
        User_info.objects.create(ex_parameter = latest_info['fields']['ex_parameter'], user_level = latest_info['fields']['user_level'])
        new_queryset = User_info.objects.all()
        user_info = serializers.serialize("json", new_queryset)
        user_info = json.loads(user_info)
        latest_info = user_info[len(user_info)-1]
        
        return Response(latest_info)

def rate_of_power(parts):
    rate = 10/8613

    if(parts == "脚"):
        return 1/(4450*rate)

    elif(parts == "肩"):
        return 1/(792*float(rate))

    elif(parts == "腕"):
        return 1/(676*float(rate))

    elif(parts == "胸"):
        return 1/(1149*float(rate))

    elif(parts == "背中"):
        return 1/(1233*float(rate))

    elif(parts == "腹腹"):
        return 1/(313*float(rate))
    
    else:
        return 0.5

def max_ex(level):
    ex = 3000
    a = 1.5

    for i in range(level-1):
        ex *= a

    return ex


#     [
  
#   	{
#     "training_menu":"ベンチプレス",
#     "training_weight":"30",
#     "training_times":"6",
#     "training_set" :"3"
#   	},

# 	{
#     "training_menu":"ベンチプレス",
#     "training_weight":"40",
#     "training_times":"4",
#     "training_set" :"3"
#  	 }

# ]



