from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST

from accounts.models import Profile
from books.models import Book
from games.models import Game
from movies.models import Movie
from serials.models import Serial
from .cart import Cart
from .forms import CartAddProductForm


def get_product(request, product_slug):
    if str(request).split('/')[-2] in list(Movie.objects.all().values_list('slug', flat=True)):
        return get_object_or_404(Movie, slug=product_slug)
    elif str(request).split('/')[-2] in list(Game.objects.all().values_list('slug', flat=True)):
        return get_object_or_404(Game, slug=product_slug)
    elif str(request).split('/')[-2] in list(Book.objects.all().values_list('slug', flat=True)):
        return get_object_or_404(Book, slug=product_slug)
    elif str(request).split('/')[-2] in list(Serial.objects.all().values_list('slug', flat=True)):
        return get_object_or_404(Serial, slug=product_slug)


@require_POST
def cart_add(request, product_slug):
    cart = Cart(request)
    product = get_product(request, product_slug)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product,
                 quantity=cd['quantity'],
                 update_quantity=cd['update'])
    if request.user.id is not None:
        profile = Profile.objects.get(user=request.user)
        profile.cart_data = request.session['cart']
        profile.save()
    return redirect('cart:cart_detail')


def cart_remove(request, product_slug):
    cart = Cart(request)
    product = get_product(request, product_slug)
    cart.remove(product)
    if request.user.id is not None:
        profile = Profile.objects.get(user=request.user)
        profile.cart_data = request.session['cart']
        profile.save()
    return redirect('cart:cart_detail')


def cart_detail(request):
    cart = Cart(request)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'],
                                                                   'update': True})
    return render(request, 'cart/detail.html', {'cart': cart})
