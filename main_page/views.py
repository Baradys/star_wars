from django.shortcuts import render
from django.views import View
from django.views.generic import ListView, DetailView, TemplateView

from itertools import chain

from django.shortcuts import render
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.views import View

from books.models import Book
from games.models import Game
from main_page.forms import ObjectFilterForm
from main_page.models import IpManager
from movies.models import Movie
from serials.models import Serial


# Create your views here.
def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[-1].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def object_counter_by_ip(request):
    ip = get_client_ip(request.request)
    if IpManager.objects.filter(ip=ip).exists():
        request.object.views.add(IpManager.objects.get(ip=ip))
    else:
        IpManager.objects.create(ip=ip)
        request.object.views.add(IpManager.objects.get(ip=ip))


class Branches(TemplateView):
    template_name = 'main_page/branches.html'


class SearchView(View):
    template_name = 'main_page/search.html'

    def get(self, request, *args, **kwargs):
        context = {}
        form = ObjectFilterForm(self.request.GET)
        if form.is_valid():
            context['form'] = form
        q = request.GET.get('text')
        if q:
            query_sets = [Movie.objects.search(query=q), Game.objects.search(query=q),
                          Book.objects.search(query=q), Serial.objects.search(query=q)]

            final_set = list(chain(*query_sets))
            final_set.sort(key=lambda x: x.name)

            paginator = Paginator(final_set, 3)
            page_number = self.request.GET.get('page')
            page_obj = paginator.get_page(page_number)
            context['object_list'] = page_obj
            context['result'] = final_set
            print(len(final_set))

        return render(request=request, template_name=self.template_name, context=context)


class PromotionView(View):
    template_name = 'main_page/promotion.html'

    def get(self, request, *args, **kwargs):
        context = {}
        products = chain(Movie.objects.all(), Game.objects.all(),
                         Book.objects.all(), Serial.objects.all())
        context['top_views'] = sorted(products, reverse=True, key=lambda x: x.views.all().count())[:4]
        return render(request=request, template_name=self.template_name, context=context)
