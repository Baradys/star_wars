from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Serial


# Create your views here.

class SerialsView(ListView):
    template_name = 'serials/all_serials.html'
    model = Serial
    context_object_name = 'serials'
