from django.conf import settings

from accounts.models import Profile
from books.models import Book
from games.models import Game
from movies.models import Movie
from itertools import chain

from serials.models import Serial


class Cart:

    def __init__(self, request):
        """
        Инициализация корзины
        """
        self.session = request.session
        if request.user.id is not None:
            profile = Profile.objects.get(user=request.user)
            request.session['cart'] = profile.cart_data
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            # сохраняем ПУСТУЮ корзину в сессии
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart

    def __iter__(self):
        """
        Перебираем товары в корзине и получаем товары из базы данных.
        """
        product_ids = self.cart.keys()
        # получаем товары и добавляем их в корзину
        products = list(chain(Movie.objects.filter(slug__in=product_ids), Game.objects.filter(slug__in=product_ids),
                              Book.objects.filter(slug__in=product_ids), Serial.objects.filter(slug__in=product_ids)))

        cart = self.cart.copy()
        for product in products:
            cart[str(product.slug)]['product'] = product

        for item in cart.values():
            item['price'] = int(item['price'])
            item['total_price'] = item['price'] * item['quantity']
            yield item

    def __len__(self):
        """
        Считаем сколько товаров в корзине
        """
        return sum(item['quantity'] for item in self.cart.values())

    def add(self, product, quantity=1, update_quantity=False):
        """
        Добавляем товар в корзину или обновляем его количество.
        """
        product_slug = str(product.slug)
        if product_slug not in self.cart:
            self.cart[product_slug] = {'quantity': 0,
                                       'price': str(product.price)}
        if update_quantity:
            self.cart[product_slug]['quantity'] = quantity
        else:
            self.cart[product_slug]['quantity'] += quantity
        self.save()

    def save(self):
        # сохраняем товар
        self.session.modified = True
        # Profile.cart_data = self.cart

    def remove(self, product):
        """
        Удаляем товар
        """
        product_slug = str(product.slug)
        if product_slug in self.cart:
            del self.cart[product_slug]
            self.save()

    def get_total_price(self):
        # получаем общую стоимость
        return sum(int(item['price']) * item['quantity'] for item in self.cart.values())

    def clear(self):
        # очищаем корзину в сессии
        del self.session[settings.CART_SESSION_ID]
        self.save()
