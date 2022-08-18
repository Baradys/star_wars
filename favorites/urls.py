from django.urls import path

from . import views

urlpatterns = [
    path('', views.favorites_list, name='favorites_list'),
    path('<id>/add/', views.add_to_favorites, name='favorites_add'),
    path('<id>/remove/', views.remove_from_favorites, name='favorites_remove'),
    path('delete/', views.delete_favorites, name='favorites_delete'),
]
