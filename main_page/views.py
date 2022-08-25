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
from movies.models import Movie
from serials.models import Serial


# Create your views here.

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
