from django.db import models
from django.urls import reverse
from django.utils.text import slugify

from main_page.models import BookManager, IpManager


# Create your models here.

class Book(models.Model):
    name = models.CharField(max_length=40)
    price = models.IntegerField(default=0)
    slug = models.SlugField(default='', null=False, db_index=True, unique=True)
    objects = BookManager()
    views = models.ManyToManyField(IpManager, related_name="book_views", blank=True)
    poster = models.ImageField(null=True, blank=True, upload_to='books/posters/')

    def __str__(self):
        return str(self.name)

    def save(self, *args, **kwargs):
        self.slug = slugify(str(self.name))
        super(Book, self).save(*args, **kwargs)

    def get_url(self):
        return reverse('book', args=[self.slug])
