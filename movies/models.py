from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.

class Countries(models.Model):
    name = models.CharField(max_length=60)


class Movie(models.Model):
    name = models.CharField(max_length=40)
    # director = models.ForeignKey()
    # composer = models.ForeignKey
    rating_rotten_tomatoes = models.DecimalField(max_digits=3, decimal_places=1,
                                                 validators=[MaxValueValidator(10), MinValueValidator(0)], blank=True,
                                                 null=True)
    rating_IMBd = models.DecimalField(max_digits=3, decimal_places=1,
                                      validators=[MaxValueValidator(10), MinValueValidator(0)], blank=True, null=True)
    countries = models.ForeignKey(Countries, on_delete=models.PROTECT, null=True, blank=True)
    timing = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(0)])
