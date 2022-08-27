from django.contrib.auth.models import User
from django.db import models
from django.urls import reverse
from django.core.validators import MaxValueValidator, MinValueValidator
from next_prev import next_in_order, prev_in_order
from main_page.models import IpManager

from main_page.models import MovieManager


# Create your models here.
class CarrierRole(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name


class Countries(models.Model):
    name = models.CharField(max_length=60)

    def __str__(self):
        return self.name


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
    birthday = models.DateField(blank=True, null=True)
    carrier_role = models.ManyToManyField(CarrierRole, blank=True, default="No information")
    birthplace = models.ForeignKey(Countries, on_delete=models.PROTECT, null=True, blank=True, related_name='actors')

    def get_url(self):
        return reverse('actor_detail', args=[self.slug])

    # def _get_total_films(self):

    def __str__(self):
        if self.gender == self.MALE:
            return f'Актер {self.first_name} {self.last_name}'
        return f'Актриса {self.first_name} {self.last_name}'


class Composer(models.Model):
    first_name = models.CharField(max_length=100, default='NoName')
    last_name = models.CharField(max_length=100, default='NoName')
    slug = models.SlugField(default='', null=False, db_index=True)
    birthday = models.DateField(blank=True, null=True)

    def get_url(self):
        return reverse('composer_detail', args=[self.slug])

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Director(models.Model):
    first_name = models.CharField(max_length=100, default='NoName')
    last_name = models.CharField(max_length=100, default='NoName')
    slug = models.SlugField(default='', null=False, db_index=True)
    birthday = models.DateField(blank=True, null=True)

    def get_url(self):
        return reverse('director_detail', args=[self.slug])

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Movie(models.Model):
    name = models.CharField(max_length=100)
    director = models.ForeignKey(Director, on_delete=models.PROTECT, null=True, blank=True, related_name='movies')
    composer = models.ForeignKey(Composer, on_delete=models.PROTECT, null=True, blank=True, related_name='movies')
    actors = models.ManyToManyField(Actor, related_name='movies', blank=True)

    rating_rotten_tomatoes = models.IntegerField(validators=[MaxValueValidator(100), MinValueValidator(0)], blank=True,
                                                 null=True)
    rating_IMBd = models.DecimalField(max_digits=3, decimal_places=1,
                                      validators=[MaxValueValidator(10), MinValueValidator(0)], blank=True, null=True)
    countries = models.ManyToManyField(Countries, blank=True, default="")
    timing = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(0)])
    date = models.DateField(blank=True, null=True)
    year = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(1960), MaxValueValidator(2030)])
    slug = models.SlugField(default='', null=False, db_index=True)
    action = models.IntegerField(blank=True, null=True)
    poster = models.ImageField(null=True, blank=True, upload_to='movies/posters/')
    video_link = models.CharField(null=True, blank=True, max_length=150)
    price = models.IntegerField(default=0)
    canon = models.BooleanField(default=True)
    objects = MovieManager()
    views = models.ManyToManyField(IpManager, related_name="movie_views", blank=True)

    class Meta:
        ordering = ('action', 'date')

    def get_next(self):
        return next_in_order(self)

    def get_prev(self):
        return prev_in_order(self)

    def get_url(self):
        return reverse('movie_detail', args=[self.slug])

    def __str__(self):
        return self.name


class FeedBack(models.Model):
    movie = models.ForeignKey(Movie, related_name='movie_feedback', on_delete=models.CASCADE, null=True, blank=True)
    user = models.ForeignKey(User, related_name='name_feedback', on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField(max_length=150)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('created',)

    def get_url(self):
        return reverse('feedback_detail', args=[self.pk])

    def __str__(self):
        return f'Отзыв пользователя {self.user} на фильм {self.movie}: {self.name}'


class Comment(models.Model):
    feedback = models.ForeignKey(FeedBack, related_name='feedback_comment', on_delete=models.CASCADE, null=True,
                                 blank=True)
    user = models.ForeignKey(User, related_name='name_comment', on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField(max_length=150)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('created',)

    def __str__(self):
        return f'Comment by {self.user} on {self.feedback}: {self.name}'


class Rating(models.Model):
    user = models.ForeignKey(User, related_name='rating', on_delete=models.CASCADE, null=True, blank=True)
    movie = models.ForeignKey(Movie, related_name='movie_rating', on_delete=models.CASCADE, null=True, blank=True)
    rating = models.SmallIntegerField(validators=[MinValueValidator(0), MaxValueValidator(10)])
