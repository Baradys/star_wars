from . import views
from django.urls import path

urlpatterns = [
    path('', views.show_start_page),
    path('movies', views.show_all_movies),
    path('games', views.show_all_games),
    path('books', views.show_all_books),
    path('serials', views.show_all_serials),

]
