# Generated by Django 4.0.5 on 2022-08-17 20:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='canon',
            field=models.BooleanField(default=True),
        ),
    ]
