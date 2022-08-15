from django.shortcuts import render
from django.views.generic import ListView
from django_filters.views import FilterView

from games.models import Game
from movies.models import Movie
from .filters import OrderFilter
from .models import OrderItem, Order
from .forms import OrderCreateForm
from cart.cart import Cart


class OrderView(FilterView):
    template_name = 'orders/order_history.html'
    model = Order
    context_object_name = 'orders'
    paginate_by = 5
    filterset_class = OrderFilter

    def get_context_data(self, **kwargs):
        context = super(OrderView, self).get_context_data(**kwargs)
        context['filter'] = OrderFilter(queryset=Order.objects.all())
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
