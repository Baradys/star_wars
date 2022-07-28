from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Book


# Create your views here.

class BooksView(ListView):
    template_name = 'books/all_books.html'
    model = Book
    context_object_name = 'books'
