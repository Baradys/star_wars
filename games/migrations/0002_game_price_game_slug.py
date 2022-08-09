# Generated by Django 4.0.5 on 2022-08-09 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('games', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='game',
            name='price',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='game',
            name='slug',
            field=models.SlugField(default='', unique=True),
        ),
    ]
