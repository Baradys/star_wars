from . import views
from django.urls import path

urlpatterns = [
    path('', views.BooksView.as_view()),
]
