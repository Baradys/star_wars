from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from django.urls import reverse
from django.utils import timezone
from django.utils.text import slugify

# Create your models here.
from movies.models import Countries


class Profile(models.Model):
    MALE = 'M'
    FEMALE = 'F'
    GENDERS = [
        (MALE, 'Мужской'),
        (FEMALE, 'Женский'),
    ]

    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    profile_pic = models.ImageField(null=True, blank=True, upload_to="accounts/profile")
    vk = models.CharField(max_length=50, null=True, blank=True)
    instagram = models.CharField(max_length=50, null=True, blank=True)
    country = models.ForeignKey(Countries, on_delete=models.PROTECT, null=True, blank=True, related_name='user_country')
    city = models.CharField(max_length=100, null=True, blank=True)
    birthday = models.DateField(blank=True, null=True)
    email = models.EmailField(unique=True, null=True, blank=True)
    gender = models.CharField(max_length=1, choices=GENDERS, default=MALE)
    first_name = models.CharField(max_length=100, null=True, blank=True)
    last_name = models.CharField(max_length=100, null=True, blank=True)
    slug = models.SlugField(null=False, db_index=True, unique=True)
    favorites_data = models.JSONField(default=None, null=True)
    cart_data = models.JSONField(default=None, null=True)

    def __str__(self):
        return str(self.user)

    def save(self, *args, **kwargs):
        self.slug = slugify(str(self.user))
        super(Profile, self).save(*args, **kwargs)

    def get_url(self):
        return reverse('profile', args=[self.slug])


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


@receiver(post_delete, sender=Profile)
def delete_user_profile(sender, instance=None, **kwargs):
    try:
        instance.user
    except User.DoesNotExist:
        pass
    else:
        instance.user.delete()


class Chat(models.Model):
    DIALOG = 'D'
    CHAT = 'C'
    CHAT_TYPE_CHOICES = (
        (DIALOG, 'Dialog'),
        (CHAT, 'Chat')
    )
    type_of_chat = models.CharField(max_length=1, choices=CHAT_TYPE_CHOICES, default=DIALOG)
    members = models.ManyToManyField(User)

    def get_url(self):
        return reverse('messages', args=[self.pk])


class Message(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    publication_date = models.DateTimeField(default=timezone.now)
    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ['publication_date']

    def __str__(self):
        return self.message
