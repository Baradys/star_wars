from django import forms


class ObjectFilterForm(forms.Form):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['text'].label = 'Название:'

    text = forms.CharField(required=False)
