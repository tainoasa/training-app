from rest_framework import serializers
from .models import Todo
from .models import Training_history, Training_list, Recommend_history,User_info


class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todo
        fields = ('id', 'title', 'body')

class Training_historySerializer(serializers.ModelSerializer):

    class Meta:
        model = Training_history
        fields = ('id', 'training_menu', 'training_weight', 'training_times', 'training_set')

class Training_listSerializer(serializers.ModelSerializer):
    class Meta:
        model = Training_list
        fields = ('id', 'training_name','training_parts', 'training_movie')

class Recommend_historySerializer(serializers.ModelSerializer):
    class Meta:
        model = Recommend_history
        fields = ('input_txt', 'recommend_name')

class User_infoSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_info
        fields = ('ex_parameter','user_level')