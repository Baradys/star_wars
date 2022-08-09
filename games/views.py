from django.shortcuts import render
from django.views.generic import ListView, DetailView

from cart.forms import CartAddProductForm
from .models import Game


# Create your views here.


class GamesView(ListView):
    template_name = 'games/all_games.html'
    model = Game
    context_object_name = 'games'


class GameDetailView(DetailView):
    template_name = 'games/one_game.html'
    model = Game
    context_object_name = 'game'

    def get_context_data(self, **kwargs):
        context = super(GameDetailView, self).get_context_data(**kwargs)
        context['cart'] = CartAddProductForm()
        return context
