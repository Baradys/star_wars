from django.db import models

from main_page.models import SerialManager


# Create your models here.


class Serial(models.Model):
    name = models.CharField(max_length=40)
    objects = SerialManager()
