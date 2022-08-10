from django.contrib import admin


# Register your models here.
from games.models import Game


@admin.register(Game)
class GameAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    list_display = ['name', 'price']
    list_editable = ['price']
