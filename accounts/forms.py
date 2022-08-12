from django.contrib.auth.models import User

from accounts.models import Profile, Message
from django import forms


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        exclude = ('slug', 'user')


class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['message']
        labels = {'message': ''}
