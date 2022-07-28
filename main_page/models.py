from django.db import models


# Create your models here.


class Movie(models.Model):
    name = models.CharField(max_length=40)


class Game(models.Model):
    name = models.CharField(max_length=40)


class Book(models.Model):
    name = models.CharField(max_length=40)


class Serial(models.Model):
    name = models.CharField(max_length=40)
