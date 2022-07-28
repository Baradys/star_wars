from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Movie


# Create your views here.

class MoviesView(ListView):
    template_name = 'movies/all_movies.html'
    model = Movie
    context_object_name = 'movies'


class MovieDetail(DetailView):
    template_name = 'movies/one_movie.html'
    model = Movie
    context_object_name = 'movie'
