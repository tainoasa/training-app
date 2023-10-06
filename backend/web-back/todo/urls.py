from django.urls import path, include
from .views import ListTraining_history, DetailTraining_history,ListTraining_list, DetailTraining_list
from .views import CreateTrainingHistoryView, CreateRecommendHistoryView
from .views import DummyRespponseApiView,ChatRespponseApiView,CalcUserExApiView

urlpatterns = [

    path('training_history/<int:pk>/', DetailTraining_history.as_view()),
    path('training_history/', ListTraining_history.as_view()),
    path('training_list/<int:pk>/', DetailTraining_list.as_view()),
    path('training_list/', ListTraining_list.as_view()),
    path('training_history/create/',CreateTrainingHistoryView.as_view()),
    path('recommend_history/create/',CreateRecommendHistoryView.as_view()),
    path('chat_dummy/',DummyRespponseApiView.as_view()),
    path('chat/',ChatRespponseApiView.as_view()),
    path('calc/',CalcUserExApiView.as_view()),
]
