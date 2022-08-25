from django.db import models
from django.db.models import Q


class MovieManager(models.Manager):
    use_for_related_fields = True

    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(name__icontains=query) | Q(slug__icontains=query))
            qs = qs.filter(or_lookup)

        return qs


class GameManager(models.Manager):
    use_for_related_fields = True

    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(name__icontains=query) | Q(slug__icontains=query))
            qs = qs.filter(or_lookup)

        return qs


class BookManager(models.Manager):
    use_for_related_fields = True

    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(name__icontains=query))
            qs = qs.filter(or_lookup)

        return qs


class SerialManager(models.Manager):
    use_for_related_fields = True

    def search(self, query=None):
        qs = self.get_queryset()
        if query:
            or_lookup = (Q(name__icontains=query))
            qs = qs.filter(or_lookup)

        return qs
