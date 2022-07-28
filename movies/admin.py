from django.contrib import admin
from .models import Movie, Countries, Composer, Director, Actor


# Register your models here.

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ['name', 'rating_rotten_tomatoes', 'rating_IMBd']
    filter_horizontal = ['countries']


@admin.register(Countries)
class CountryAdmin(admin.ModelAdmin):
    list_display = ['name']


@admin.register(Actor)
class ActorAdmin(admin.ModelAdmin):
    pass


@admin.register(Director)
class DirectorAdmin(admin.ModelAdmin):
    pass


@admin.register(Composer)
class ComposerAdmin(admin.ModelAdmin):
    pass
