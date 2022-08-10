from django.contrib import admin
from .models import Order, OrderItem


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    fields = ('product_name', 'product', 'price', 'quantity')
    readonly_fields = ('product',)
    exclude = ('game', 'movie')
    extra = 0

    def get_readonly_fields(self, request, obj=None):
        return self.readonly_fields + ('product_name',)

    @staticmethod
    def product_name(instance):
        return instance.game if instance.product == 'G' else instance.movie


class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'email', 'paid',
                    'created', 'updated']
    list_filter = ['paid', 'created', 'updated']
    inlines = [OrderItemInline]

    def get_readonly_fields(self, request, obj=None):
        return self.readonly_fields + ('order_cost',)

    @staticmethod
    def order_cost(instance):
        return instance.get_total_cost()


admin.site.register(Order, OrderAdmin)
