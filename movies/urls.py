from . import views
from django.urls import path

urlpatterns = [
    path('', views.MovieView.as_view(), name='movies'),
    path('<slug>', views.MovieDetail.as_view(), name='movie_detail'),
    path('actors/', views.ActorView.as_view()),
    path('actors/<slug>', views.ActorDetail.as_view(), name='actor_detail'),
    path('directors/', views.DirectorView.as_view()),
    path('directors/<slug>', views.DirectorDetail.as_view(), name='director_detail'),
    path('composers/', views.ComposerView.as_view()),
    path('composers/<slug>', views.ComposerDetail.as_view(), name='composer_detail'),

]
