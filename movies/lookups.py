from ajax_select import register, LookupChannel
from .models import Movie


class CustomLookupChannel(LookupChannel):
    min_length = 3

    def check_auth(self, request):
        pass


@register('movie')
class MovieLookup(CustomLookupChannel):
    model = Movie

    def get_query(self, q, request):
        return self.model.objects.filter(name__icontains=q)[:10]
