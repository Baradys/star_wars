from django.shortcuts import render

from django.views.generic import ListView, DetailView
from .models import Movie, Game, Book, Serial


# Create your views here.

class MoviesView(ListView):
    template_name = 'main_page/all_movies.html'
    model = Movie
    context_object_name = 'movies'


class GamesView(ListView):
    template_name = 'main_page/all_games.html'
    model = Game
    context_object_name = 'games'


class BooksView(ListView):
    template_name = 'main_page/all_books.html'
    model = Book
    context_object_name = 'books'


class SerialsView(ListView):
    template_name = 'main_page/all_serials.html'
    model = Serial
    context_object_name = 'serials'
