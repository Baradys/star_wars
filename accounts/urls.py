from django.contrib.auth.decorators import login_required
from django.urls import path

from . import views

urlpatterns = [
    path('signup/', views.SignUpView.as_view(), name='signup'),
    path('edit-profile/<slug>/', views.EditProfileView.as_view(), name='profile_update'),
    path('delete-profile/<slug>/', views.DeleteProfileView.as_view(), name='profile_delete'),
    path('dialogs/', login_required(views.DialogsView.as_view()), name='dialogs'),
    path('dialogs/create/<pk>/', login_required(views.CreateDialogView.as_view()), name='create_dialog'),
    path('dialogs/<pk>/', login_required(views.MessagesView.as_view()), name='messages'),
    path('<slug>', views.ProfilePageView.as_view(), name='profile'),
]
