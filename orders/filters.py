import django_filters
from .models import Order


class OrderFilter(django_filters.FilterSet):
    years = set(Order.objects.all().values_list('created__year'))
    CHOICES = sorted((i[0], i[0]) for i in years)
    release_year = django_filters.ChoiceFilter(field_name='created', lookup_expr='year', choices=CHOICES,
                                               label='Год заказа')

    class Meta:
        model = Order
        fields = {
        }
