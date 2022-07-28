from django.db import models


# Create your models here.


class Serial(models.Model):
    name = models.CharField(max_length=40)
