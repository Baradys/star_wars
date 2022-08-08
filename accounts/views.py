from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView, UpdateView, DeleteView

from .forms import ProfileForm
from .models import Profile


class SignUpView(CreateView):
    model = Profile
    template_name = 'accounts/signup.html'
    form_class = UserCreationForm
    success_url = reverse_lazy('login')


class ProfilePageView(DetailView):
    model = Profile
    template_name = 'accounts/detail_profile.html'
    context_object_name = 'profile'


class EditProfileView(UpdateView):
    model = Profile
    form_class = ProfileForm
    template_name = 'accounts/update_profile.html'
    success_url = reverse_lazy('main_page')


class DeleteProfileView(DeleteView):
    model = Profile
    template_name = 'accounts/delete_profile.html'
    success_url = reverse_lazy('main_page')
