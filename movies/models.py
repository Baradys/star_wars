from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.

class Countries(models.Model):
    name = models.CharField(max_length=60)

    def __str__(self):
        return self.name


class Movie(models.Model):
    name = models.CharField(max_length=40)
    # director = models.ForeignKey()
    # composer = models.ForeignKey
    rating_rotten_tomatoes = models.IntegerField(validators=[MaxValueValidator(100), MinValueValidator(0)], blank=True,
                                                 null=True)
    rating_IMBd = models.DecimalField(max_digits=3, decimal_places=1,
                                      validators=[MaxValueValidator(10), MinValueValidator(0)], blank=True, null=True)
    countries = models.ManyToManyField(Countries)
    timing = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(0)])
    date = models.DateField(blank=True, null=True)
    year = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(1960), MaxValueValidator(2030)])

    def __str__(self):
        return self.name
