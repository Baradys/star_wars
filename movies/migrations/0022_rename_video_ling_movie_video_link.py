# Generated by Django 4.0.5 on 2022-08-08 11:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0021_movie_video_ling'),
    ]

    operations = [
        migrations.RenameField(
            model_name='movie',
            old_name='video_ling',
            new_name='video_link',
        ),
    ]
