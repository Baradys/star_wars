from django.db import models

# Create your models here.
from django.urls import reverse
from django.utils.text import slugify

from main_page.models import GameManager, IpManager


class Game(models.Model):
    name = models.CharField(max_length=40)
    price = models.IntegerField(default=0)
    slug = models.SlugField(default='', null=False, db_index=True, unique=True)
    objects = GameManager()
    views = models.ManyToManyField(IpManager, related_name="game_views", blank=True)

    def __str__(self):
        return str(self.name)

    def save(self, *args, **kwargs):
        self.slug = slugify(str(self.name))
        super(Game, self).save(*args, **kwargs)

    def get_url(self):
        return reverse('game', args=[self.slug])
