from django.contrib import admin
from .models import Movie, Countries, Composer, Director, Actor
from django.utils.safestring import mark_safe


# Register your models here.

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ['name', 'poster_show', 'year', 'timing', 'rating_rotten_tomatoes', 'rating_IMBd']
    filter_horizontal = ['countries', 'actors']
    prepopulated_fields = {'slug': ('name',)}

    def poster_show(self, poster):
        if poster.movie_poster:
            return mark_safe(f"<img src='{poster.movie_poster.url}' width='60'")
        return None

    poster_show.__name__ = 'poster'


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
