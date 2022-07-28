from . import views
from django.urls import path

urlpatterns = [
    path('', views.GamesView.as_view()),
]