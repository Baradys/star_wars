# Generated by Django 4.0.5 on 2022-07-28 19:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0009_movie_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='actor',
            name='birthday',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='movie',
            name='actors',
            field=models.ManyToManyField(blank=True, related_name='movies', to='movies.actor'),
        ),
    ]
