from django.contrib import admin

# Register your models here.
from .models import Profile, Message, Chat


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'user_id']


@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ['chat', 'author', 'message']


@admin.register(Chat)
class ChatAdmin(admin.ModelAdmin):
    filter_horizontal = ['members']
    list_display = ['type_of_chat']
