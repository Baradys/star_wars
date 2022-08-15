from . import views
from django.urls import path

urlpatterns = [
    path('', views.OrderView.as_view(), name='orders'),
    path('create/', views.order_create, name='order_create'),
]
