# Generated by Django 4.0.5 on 2022-08-27 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0002_book_views'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='price',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='book',
            name='slug',
            field=models.SlugField(default='', unique=True),
        ),
    ]