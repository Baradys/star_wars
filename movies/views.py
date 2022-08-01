from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Movie, Actor, Director, Composer


# Create your views here.

class MovieView(ListView):
    template_name = 'movies/all_movies.html'
    model = Movie
    context_object_name = 'movies'


class MovieDetail(DetailView):
    template_name = 'movies/one_movie.html'
    model = Movie
    context_object_name = 'movie'


class ActorView(ListView):
    template_name = 'movies/all_actors.html'
    model = Actor
    context_object_name = 'actors'


class ActorDetail(DetailView):
    template_name = 'movies/one_actor.html'
    model = Actor
    context_object_name = 'actor'


class DirectorView(ListView):
    template_name = 'movies/all_directors.html'
    model = Director
    context_object_name = 'directors'


class DirectorDetail(DetailView):
    template_name = 'movies/one_director.html'
    model = Director
    context_object_name = 'director'


class ComposerView(ListView):
    template_name = 'movies/all_composers.html'
    model = Composer
    context_object_name = 'composers'


class ComposerDetail(DetailView):
    template_name = 'movies/one_composer.html'
    model = Composer
    context_object_name = 'composer'
