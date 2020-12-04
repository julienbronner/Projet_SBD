from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse
from .models import reduction, client, train, voiture, place, billet, reservation

def index(request):
    # template = loader.get_template('agence/index.html')
    context = {}
    return render(request, 'agence/index.html', context)
    # return HttpResponse(template.render(request=request))

def listing(request):
    trains = train.objects.all()
    context = {
        'trains': trains
    }
    return render(request, 'agence/all_train.html', context)

def search(request):
    query_depart = request.GET.get('query_depart')
    query_arrivee = request.GET.get('query_arrivee')
    query_date = request.GET.get('query_date')
    if query_date:
        year, month, day = query_date.split('-')
    if (not query_depart and not query_arrivee):
        trains = billet.objects.all()
    elif not query_arrivee:
        trains = billet.objects.filter(depart_ville__icontains=query_depart)
    elif not query_depart:
        trains = billet.objects.filter(arrivee_ville__icontains=query_arrivee)
    else:
        trains = billet.objects.filter(depart_ville__icontains=query_depart, arrivee_ville__icontains=query_arrivee)
    if query_date:
        title = f"Trajets {query_depart}-{query_arrivee} le {day}/{month}/{year}"
    else:
        title = f"Trajets {query_depart}-{query_arrivee}"
    context = {
        'trains': trains,
        'title': title
    }
    return render(request, 'agence/search.html', context)