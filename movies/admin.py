from django.contrib import admin
from .models import Movie, Countries, Composer, Director, Actor


# Register your models here.

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ['name', 'rating_rotten_tomatoes', 'rating_IMBd']
    filter_horizontal = ['countries']
    prepopulated_fields = {'slug': ('name',)}


@admin.register(Countries)
class CountryAdmin(admin.ModelAdmin):
    list_display = ['name']


@admin.register(Actor)
class ActorAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('first_name', 'last_name')}


@admin.register(Director)
class DirectorAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('first_name', 'last_name')}


@admin.register(Composer)
class ComposerAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('first_name', 'last_name')}
