from . import views
from django.urls import path

urlpatterns = [
    path('', views.OrderHistoryView.as_view(), name='orders'),
    path('create/', views.order_create, name='order_create'),
    path('<pk>/', views.OrderDetailView.as_view(), name='order_detail')
]
