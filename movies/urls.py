from . import views
from django.urls import path

urlpatterns = [
    path('', views.MoviesView.as_view()),
    path('<slug>', views.MovieDetail.as_view(), name='movie_detail'),
]
