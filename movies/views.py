from django.shortcuts import render
from django.urls import reverse_lazy, reverse
from django.views import View
from django.views.generic import ListView, DetailView
from django.views.generic.edit import FormMixin, FormView

from cart.forms import CartAddProductForm
from .forms import FeedbackForm, CommentForm, RatingForm
from django.http.response import HttpResponseRedirect
from django.db.utils import IntegrityError
from .models import Movie, Actor, Director, Composer, FeedBack


# Create your views here.

class MovieView(ListView):
    template_name = 'movies/all_movies.html'
    model = Movie
    context_object_name = 'movies'


class MovieDetail(DetailView):
    model = Movie
    template_name = 'movies/one_movie.html'
    context_object_name = 'movie'

    def get_context_data(self, **kwargs):
        context = super(MovieDetail, self).get_context_data(**kwargs)
        context['rating'] = RatingForm(self.request.POST)
        context['feedback'] = FeedbackForm(self.request.POST)
        context['forms'] = [(FeedbackForm, 'feedback', 'Добавить отзыв'), (RatingForm, 'rating', 'Оценить')]
        context['cart'] = CartAddProductForm()
        return context

    def post(self, request, *args, **kwargs):
        if 'name' in self.request.POST:
            form = FeedbackForm(request.POST)
            if form.is_valid:
                feedback = form.save(commit=False)
                feedback.user = self.request.user
                feedback.movie = self.get_object()
                feedback.save()
        elif 'rating' in self.request.POST:
            form = RatingForm(request.POST)
            if form.is_valid:
                rating = form.save(commit=False)
                rating.user = self.request.user
                rating.movie = self.get_object()
                rating.save()
        return HttpResponseRedirect(f'/movies/{self.get_object().slug}')


class FeedbackDetail(DetailView, FormMixin):
    model = FeedBack
    template_name = 'movies/one_feedback.html'
    context_object_name = 'feedback'
    form_class = CommentForm

    def get_success_url(self):
        return reverse_lazy('feedback_detail', kwargs={'pk': self.get_object().pk})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def form_valid(self, form):
        comment = form.save(commit=False)
        comment.user = self.request.user
        comment.feedback = self.get_object()
        comment.save()
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
