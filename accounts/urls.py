from django.urls import path

from . import views

urlpatterns = [
    path('signup/', views.SignUpView.as_view(), name='signup'),
    path('edit-profile/<slug>/', views.EditProfileView.as_view(), name='profile_update'),
    path('delete-profile/<slug>/', views.DeleteProfileView.as_view(), name='profile_delete'),
    path('<slug>', views.ProfilePageView.as_view(), name='profile'),
]
