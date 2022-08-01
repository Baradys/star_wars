# Generated by Django 4.0.5 on 2022-08-01 21:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0016_remove_movie_yearseeess'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='movie',
            options={'ordering': ('action', 'date')},
        ),
        migrations.AddField(
            model_name='movie',
            name='movie_poster',
            field=models.ImageField(blank=True, null=True, upload_to='movies_tmp/'),
        ),
    ]
