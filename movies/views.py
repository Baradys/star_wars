from django.core.paginator import Paginator
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import ListView, DetailView
from django.views.generic.edit import FormMixin
from django.db.models import Q

from cart.forms import CartAddProductForm
from main_page.views import object_counter_by_ip
from .forms import FeedbackForm, CommentForm, RatingForm, SearchForm, MovieFilterForm
from django.http.response import HttpResponseRedirect
from .models import Movie, Actor, Director, Composer, FeedBack


# Create your views here.

class MovieView(View):
    template_name = 'movies/all_movies.html'
    model = Movie

    def get(self, request, *args, **kwargs):
        movies = Movie.objects.all()
        form = MovieFilterForm(self.request.GET)
        if form.is_valid():
            if form.cleaned_data['canon']:
                movies = movies.filter(canon=form.cleaned_data['canon'])
        paginator = Paginator(movies, 3)
        page_number = self.request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        context = {'movies': page_obj, 'form': form}
        return render(self.request, 'movies/all_movies.html', context)


class MovieDetail(DetailView):
    model = Movie
    template_name = 'movies/one_movie.html'
    context_object_name = 'movie'

    def get_context_data(self, **kwargs):
        object_counter_by_ip(self)
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


class SearchView(View):
    def get(self, request, *args, **kwargs):
        form = SearchForm(request.GET)
        result = None
        if form.is_valid():
            q = Q()
            movie = form.cleaned_data['movie']
            if movie:
                q.add(Q(**{'name__icontains': movie}), Q.AND)
            countries = form.cleaned_data['countries']
            if countries:
                if len(countries) == 1:
                    q.add(Q(**{'countries__id': countries[0]}), Q.AND)
                else:
                    q.add(Q(**{'countries__in': countries}), Q.AND)
            release_date_from = form.cleaned_data['release_date_from']
            if release_date_from:
                q.add(Q(**{'date__gte': release_date_from}), Q.AND)
            release_date_to = form.cleaned_data['release_date_to']
            if release_date_to:
                q.add(Q(**{'date__lte': release_date_to}), Q.AND)
            if q:
                result = Movie.objects.filter(q)
            else:
                result = Movie.objects.none()
        context = {'form': form}
        if result and result.exists():
            context.update({'results': result})
        return render(request, 'movies/search.html', context)
