# Generated by Django 4.0.5 on 2022-08-01 16:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0015_rename_action_time_movie_action_movie_yearseeess'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='movie',
            name='yearseeess',
        ),
    ]