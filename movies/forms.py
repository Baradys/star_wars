from django import forms
from django.forms import Textarea, ChoiceField

from .models import FeedBack, Comment, Rating
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User


class FeedbackForm(forms.ModelForm):
    class Meta:
        model = FeedBack
        fields = ('name', 'body')
        labels = {
            'name': 'Название отзыва',
            'body': 'Текст отзыва',
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
        self.fields['name'].widget = Textarea(attrs={'rows': 1})
        self.fields['body'].widget = Textarea(attrs={'rows': 5})


class RatingForm(forms.ModelForm):
    CHOICES = (
        (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7),
        (8, 8),
        (9, 9),
        (10, 10),
    )

    class Meta:
        model = Rating
        fields = ('rating',)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
        self.fields['rating'] = ChoiceField(choices=self.CHOICES)


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
