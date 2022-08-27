from django.shortcuts import render
from django.views.generic import ListView, DetailView

from cart.forms import CartAddProductForm
from main_page.views import object_counter_by_ip
from .models import Book


# Create your views here.

class BooksView(ListView):
    template_name = 'books/all_books.html'
    model = Book
    context_object_name = 'books'


class BookDetailView(DetailView):
    template_name = 'books/one_book.html'
    model = Book
    context_object_name = 'book'

    def get_context_data(self, **kwargs):
        context = super(BookDetailView, self).get_context_data(**kwargs)
        context['cart'] = CartAddProductForm()
        object_counter_by_ip(self)
        return context
