# Generated by Django 4.0.5 on 2022-08-27 14:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0003_book_price_book_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='poster',
            field=models.ImageField(blank=True, null=True, upload_to='books/posters/'),
        ),
    ]
