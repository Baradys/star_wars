from . import views
from django.urls import path

urlpatterns = [
    # path('', views.show_start_page),
    path('movies', views.MoviesView.as_view()),
    path('games', views.GamesView.as_view()),
    path('books', views.BooksView.as_view()),
    path('serials', views.SerialsView.as_view()),
]
