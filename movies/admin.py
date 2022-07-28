from django.contrib import admin
from .models import Movie, Countries


# Register your models here.

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ['name', 'rating_rotten_tomatoes', 'rating_IMBd']
    filter_horizontal = ['countries']


@admin.register(Countries)
class MovieAdmin(admin.ModelAdmin):
    list_display = ['name']
