# Generated by Django 4.0.5 on 2022-08-26 14:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_page', '0001_initial'),
        ('games', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='game',
            name='views',
            field=models.ManyToManyField(blank=True, related_name='game_views', to='main_page.ipmanager'),
        ),
    ]