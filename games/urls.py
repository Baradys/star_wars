from . import views
from django.urls import path

urlpatterns = [
    path('', views.GamesView.as_view()),
    path('<slug>', views.GameDetailView.as_view(), name='game'),
]
