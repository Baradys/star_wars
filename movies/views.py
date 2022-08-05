from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import FormMixin
from .forms import FeedbackForm

from .models import Movie, Actor, Director, Composer


# Create your views here.

class MovieView(ListView):
    template_name = 'movies/all_movies.html'
    model = Movie
    context_object_name = 'movies'


class MovieDetail(DetailView, FormMixin):
    template_name = 'movies/one_movie.html'
    model = Movie
    context_object_name = 'movie'
    form_class = FeedbackForm

    def get_success_url(self):
        return reverse_lazy('movie_detail', kwargs={'slug': self.get_object().slug})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def form_valid(self, form):
        feedback = form.save(commit=False)
        feedback.user = self.request.user
        feedback.movie = self.get_object()
        feedback.save()
        return super().form_valid(form)


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
