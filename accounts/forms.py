from django.contrib.auth.models import User

from accounts.models import Profile, Message
from django import forms


class ProfileForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['profile_pic'].label = 'Поменять аватар'

    profile_pic = forms.ImageField(required=False,
                                   widget=forms.FileInput,
                                   )

    class Meta:
        model = Profile
        exclude = ('slug', 'user', 'favorites_data', 'cart_data')


class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['message']
        labels = {'message': ''}
