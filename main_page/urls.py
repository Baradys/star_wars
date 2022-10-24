from . import views
from django.urls import path

urlpatterns = [
    path('', views.Branches.as_view(), name='main_page'),
    path('search/', views.SearchView.as_view(), name='global_search'),
    path('promotion/', views.PromotionView.as_view(), name='promotion'),


]
