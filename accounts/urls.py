from django.urls import path

from . import views

urlpatterns = [
    path('signup/', views.SignUpView.as_view(), name='signup'),
    path('<slug>', views.ProfilePageView.as_view(), name='profile'),
]
