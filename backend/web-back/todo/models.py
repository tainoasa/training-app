from django.db import models


class Todo(models.Model):
    title = models.CharField(max_length=200)
    body = models.TextField()

    def __str__(self):
        return self.title

class Training_history(models.Model):
    training_menu= models.CharField(max_length=200)
    training_weight = models.IntegerField(blank=False, null=False)
    training_times = models.IntegerField(blank=False, null=False)
    training_set = models.IntegerField(blank=False, null=False)

    def __str__(self):
        return self.training_menu

class Training_list(models.Model):
    training_name = models.CharField(max_length=30)
    training_parts = models.CharField(max_length=30)
    training_movie = models.URLField(blank=True)

    def __str__(self):
        return self.training_name

class Recommend_history(models.Model):
    input_txt = models.TextField()
    recommend_name = models.CharField(max_length=30)

class User_info(models.Model):
    ex_parameter = models.IntegerField(blank=True, null=True)
    user_level = models.IntegerField(blank=True, null=True)

