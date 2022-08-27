from django.shortcuts import render
from django.views.generic import ListView, DetailView

from cart.forms import CartAddProductForm
from main_page.views import object_counter_by_ip
from .models import Serial


# Create your views here.

class SerialsView(ListView):
    template_name = 'serials/all_serials.html'
    model = Serial
    context_object_name = 'serials'


class SerialDetailView(DetailView):
    template_name = 'serials/one_serial.html'
    model = Serial
    context_object_name = 'serial'

    def get_context_data(self, **kwargs):
        context = super(SerialDetailView, self).get_context_data(**kwargs)
        context['cart'] = CartAddProductForm()
        object_counter_by_ip(self)
        return context
