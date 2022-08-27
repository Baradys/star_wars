from django.db import models
from django.urls import reverse
from django.utils.text import slugify

from main_page.models import SerialManager, IpManager


# Create your models here.


class Serial(models.Model):
    name = models.CharField(max_length=40)
    price = models.IntegerField(default=0)
    slug = models.SlugField(default='', null=False, db_index=True, unique=True)
    objects = SerialManager()
    views = models.ManyToManyField(IpManager, related_name="serial_views", blank=True)

    def __str__(self):
        return str(self.name)

    def save(self, *args, **kwargs):
        self.slug = slugify(str(self.name))
        super(Serial, self).save(*args, **kwargs)

    def get_url(self):
        return reverse('serial', args=[self.slug])
