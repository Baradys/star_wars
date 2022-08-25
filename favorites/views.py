from django.shortcuts import render, redirect

# Create your views here.
from django.views.generic import ListView

from accounts.models import Profile
from games.models import Game
from movies.models import Movie


def favorites_list(request):
    favorites = []
    profile = Profile.objects.get(user=request.user)
    request.session['favorites'] = profile.favorites_data
    if request.session.get('favorites'):
        for favorites_item in request.session.get('favorites'):
            if favorites_item['type'] == 'movie':
                favorites.append(Movie.objects.get(id=int(favorites_item['id'])))
            elif favorites_item['type'] == 'game':
                favorites.append(Game.objects.get(id=int(favorites_item['id'])))
    context = {'favorites': sorted(favorites, key=str)}
    return render(request, 'favorites/favorites_list.html', context=context)


def add_to_favorites(request, id):
    if request.method == 'POST':
        if not request.session.get('favorites'):
            request.session['favorites'] = list()
        else:
            request.session['favorites'] = list(request.session['favorites'])

    item_exist = next((item for item in request.session['favorites'] if
                       item['type'] == request.POST.get('type') and item['id'] == id), False)

    add_data = {
        'type': request.POST.get('type'),
        'id': id,
    }
    if not item_exist:
        request.session['favorites'].append(add_data)
        request.session.modified = True
        profile = Profile.objects.get(user=request.user)
        profile.favorites_data = request.session['favorites']
        profile.save()
    return redirect(request.POST.get('url_from'))


def remove_from_favorites(request, id):
    if request.method == 'POST':
        for item in request.session['favorites']:
            if item['id'] == id and item['type'] == request.POST.get('type'):
                item.clear()

        while {} in request.session['favorites']:
            request.session['favorites'].remove({})

        if not request.session['favorites']:
            del request.session['favorites']

        request.session.modified = True
        profile = Profile.objects.get(user=request.user)
        if 'favorites' in request.session.keys():
            profile.favorites_data = request.session['favorites']
        else:
            profile.favorites_data = None
        profile.save()
    return redirect(request.POST.get('url_from'))


def delete_favorites(request):
    if request.session.get('favorites'):
        del request.session['favorites']
        request.session.modified = True
        profile = Profile.objects.get(user=request.user)
        profile.favorites_data = None
        profile.save()
    return redirect("/favorites/")
