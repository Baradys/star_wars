from django.contrib.auth.models import User
from django.db import models

# Create your models here.
from django.urls import reverse

from games.models import Game
from movies.models import Countries, Movie


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    email = models.EmailField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    paid = models.BooleanField(default=False)

    class Meta:
        ordering = ('-created',)
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'

    def __str__(self):
        return f'Order {self.id}'

    def get_total_cost(self):
        return sum(item.get_cost() for item in self.items.all())

    def get_url(self):
        return reverse('order_detail', args=[self.pk])


class OrderItem(models.Model):
    PRODUCT_CHOICES = (
        ('M', 'Movie'),
        ('G', 'Game'),
    )

    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')
    product = models.CharField(max_length=1, choices=PRODUCT_CHOICES, editable=False)
    game = models.ForeignKey(Game, null=True, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, null=True, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f'{self.order}'

    def get_cost(self):
        return self.price * self.quantity
