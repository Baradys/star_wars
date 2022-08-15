import django_filters
from .models import Order


class OrderFilter(django_filters.FilterSet):
    # years = Order.created.all
    # print(years)
    CHOICES = list((i, i) for i in range(2019, 2023))
    release_year = django_filters.ChoiceFilter(field_name='created', lookup_expr='year', choices=CHOICES)

    class Meta:
        model = Order
        fields = {
        }
