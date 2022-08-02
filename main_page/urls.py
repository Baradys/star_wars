from . import views
from django.urls import path

urlpatterns = [
    path('', views.Branches.as_view(), name='main_page'),
]
