# Generated by Django 4.0.5 on 2022-08-27 14:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('games', '0002_game_views'),
    ]

    operations = [
        migrations.AddField(
            model_name='game',
            name='poster',
            field=models.ImageField(blank=True, null=True, upload_to='games/posters/'),
        ),
    ]