from django.contrib import admin

from serials.models import Serial


# Register your models here.
@admin.register(Serial)
class SerialAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    list_display = ['name', 'price']
    list_editable = ['price']
    filter_horizontal = ['views']
