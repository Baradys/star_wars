from django.contrib.auth.models import User

from accounts.models import Profile
from django import forms


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        exclude = ('slug', 'user')

