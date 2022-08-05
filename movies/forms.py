from django import forms
from django.forms import Textarea

from .models import FeedBack, Comment
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User


class FeedbackForm(forms.ModelForm):
    class Meta:
        model = FeedBack
        fields = ('name', 'body')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
        self.fields['name'].widget = Textarea(attrs={'rows': 1})
        self.fields['body'].widget = Textarea(attrs={'rows': 5})


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('name', 'body')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
        self.fields['name'].widget = Textarea(attrs={'rows': 1})
        self.fields['body'].widget = Textarea(attrs={'rows': 5})
