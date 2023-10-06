from django.contrib import admin
from .models import Todo
from .models import Training_history
from .models import Training_list
from .models import Recommend_history, User_info


admin.site.register(Todo)
admin.site.register(Training_history)
admin.site.register(Training_list)
admin.site.register(Recommend_history)
admin.site.register(User_info)
