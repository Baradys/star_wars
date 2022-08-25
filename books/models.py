from django.db import models

from main_page.models import BookManager


# Create your models here.

class Book(models.Model):
    name = models.CharField(max_length=40)
    objects = BookManager()
