import re

from django.shortcuts import render
from django.views.generic import DetailView
from django_filters.views import FilterView

from games.models import Game
from movies.models import Movie
from .filters import OrderFilter
from .models import OrderItem, Order
from .forms import OrderCreateForm
from cart.cart import Cart


class OrderHistoryView(FilterView):
    template_name = 'orders/order_history.html'
    model = Order
    context_object_name = 'orders'
    paginate_by = 5
    filterset_class = OrderFilter

    def get_context_data(self, **kwargs):
        context = super(OrderHistoryView, self).get_context_data(**kwargs)
        context['filter'] = OrderFilter(queryset=Order.objects.all())
        return context


class OrderDetailView(DetailView):
    template_name = 'orders/order_detail.html'
    model = Order
    context_object_name = 'order'

    def get_context_data(self, **kwargs):
        order_id = re.search(r'\d+', str(self.request)).group()
        context = super(OrderDetailView, self).get_context_data(**kwargs)
        context['order_items'] = OrderItem.objects.filter(order=order_id)
        return context


def order_create(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            order.user = request.user
            order.save()
            for item in cart:
                if isinstance(item['product'], Movie):
                    OrderItem.objects.create(order=order,
                                             product='M',
                                             movie=item['product'],
                                             price=item['price'],
                                             quantity=item['quantity'])
                elif isinstance(item['product'], Game):
                    OrderItem.objects.create(order=order,
                                             product='G',
                                             game=item['product'],
                                             price=item['price'],
                                             quantity=item['quantity'])
            # очистка корзины
            cart.clear()
            return render(request, 'orders/created.html',
                          {'order': order})
    else:
        form = OrderCreateForm
    return render(request, 'orders/create.html',
                  {'cart': cart, 'form': form})
