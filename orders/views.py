from django.shortcuts import render

from games.models import Game
from movies.models import Movie
from .models import OrderItem
from .forms import OrderCreateForm
from cart.cart import Cart


def order_create(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save()
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
