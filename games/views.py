from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Game


# Create your views here.


class GamesView(ListView):
    template_name = 'games/all_games.html'
    model = Game
    context_object_name = 'games'
