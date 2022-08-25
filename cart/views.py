from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST

from accounts.models import Profile
from games.models import Game
from movies.models import Movie
from .cart import Cart
from .forms import CartAddProductForm


@require_POST
def cart_add(request, product_slug):
    cart = Cart(request)
    if str(request).split('/')[-2] in list(Movie.objects.all().values_list('slug', flat=True)):
        product = get_object_or_404(Movie, slug=product_slug)
    else:
        product = get_object_or_404(Game, slug=product_slug)
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
    if str(request).split('/')[-2] in list(Movie.objects.all().values_list('slug', flat=True)):
        product = get_object_or_404(Movie, slug=product_slug)
    else:
        product = get_object_or_404(Game, slug=product_slug)
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
