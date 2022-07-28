from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.
class Actor(models.Model):
    MALE = 'M'
    FEMALE = 'F'
    GENDERS = [
        (MALE, 'Мужчина'),
        (FEMALE, 'Женщина'),
    ]

    first_name = models.CharField(max_length=100, default='NoName')
    last_name = models.CharField(max_length=100, default='NoName')
    gender = models.CharField(max_length=1, choices=GENDERS, default=MALE)
    slug = models.SlugField(default='', null=False, db_index=True)

    def __str__(self):
        if self.gender == self.MALE:
            return f'Актер {self.first_name} {self.last_name}'
        return f'Актриса {self.first_name} {self.last_name}'


class Composer(models.Model):
    first_name = models.CharField(max_length=100, default='NoName')
    last_name = models.CharField(max_length=100, default='NoName')
    slug = models.SlugField(default='', null=False, db_index=True)
    birthday = models.DateField(blank=True, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Director(models.Model):
    first_name = models.CharField(max_length=100, default='NoName')
    last_name = models.CharField(max_length=100, default='NoName')
    slug = models.SlugField(default='', null=False, db_index=True)
    birthday = models.DateField(blank=True, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Countries(models.Model):
    name = models.CharField(max_length=60)

    def __str__(self):
        return self.name


class Movie(models.Model):
    name = models.CharField(max_length=40)
    director = models.ForeignKey(Director, on_delete=models.PROTECT, null=True, blank=True, related_name='movies')
    composer = models.ForeignKey(Composer, on_delete=models.PROTECT, null=True, blank=True, related_name='movies')
    actors = models.ManyToManyField(Actor, related_name='movies', blank=True)

    rating_rotten_tomatoes = models.IntegerField(validators=[MaxValueValidator(100), MinValueValidator(0)], blank=True,
                                                 null=True)
    rating_IMBd = models.DecimalField(max_digits=3, decimal_places=1,
                                      validators=[MaxValueValidator(10), MinValueValidator(0)], blank=True, null=True)
    countries = models.ManyToManyField(Countries)
    timing = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(0)])
    date = models.DateField(blank=True, null=True)
    year = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(1960), MaxValueValidator(2030)])
    slug = models.SlugField(default='', null=False, db_index=True)

    def __str__(self):
        return self.name
