from django.contrib import admin

from books.models import Book


# Register your models here.

@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    list_display = ['name', 'price']
    list_editable = ['price']
    filter_horizontal = ['views']

