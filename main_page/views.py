from django.shortcuts import render

from django.views.generic import ListView, DetailView, TemplateView


# Create your views here.

class Branches(TemplateView):
    template_name = 'main_page/branches.html'
