from django import forms
from django.forms import Textarea, ChoiceField, CharField

from crispy_forms.bootstrap import InlineCheckboxes
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout

from ajax_select.fields import AutoCompleteSelectField

from .models import FeedBack, Comment, Rating, Movie, Countries


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


class SearchForm(forms.Form):
    COUNTRY_CHOICES = (
        ((country['id'], country['name']) for country in Countries.objects.all().values('id', 'name'))
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['countries'].label = 'Страна'
        self.fields['movie'].label = 'Название'
        # self.fields['rating'].label = 'Рейтинг'
        self.fields['release_date_from'].label = 'Дата релиза (с)'
        self.fields['release_date_to'].label = 'Дата релиза (по)'

        self.helper = FormHelper()
        self.helper.form_class = 'form-check form-check-inline'
        self.helper.layout = Layout(InlineCheckboxes('countries'))

    movie = CharField()
    countries = forms.MultipleChoiceField(choices=COUNTRY_CHOICES,
                                          widget=forms.CheckboxSelectMultiple,
                                          required=False)
    release_date_from = forms.DateField(
        widget=forms.TextInput(
            attrs={'type': 'date'}
        ),
        required=False
    )

    release_date_to = forms.DateField(
        widget=forms.TextInput(
            attrs={'type': 'date'}
        ),
        required=False
    )


class MovieFilterForm(forms.Form):
    canon = forms.BooleanField(required=False)
