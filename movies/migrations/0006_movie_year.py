# Generated by Django 4.0.5 on 2022-07-28 17:54

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0005_movie_date_alter_movie_rating_rotten_tomatoes'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='year',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(1960), django.core.validators.MaxValueValidator(2030)]),
        ),
    ]
