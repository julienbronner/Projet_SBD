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
    query = request.GET.get('query')
    if not query:
        trains = train.objects.all()
    else:
        trains = train.objects.filter(depart_ville__icontains=query)
    if not trains.exists():
        trains = train.objects.filter(arrivee_ville__icontains=query)
    title = "Résultats pour la requête %s"%query
    context = {
        'trains': trains,
        'title': title
    }
    return render(request, 'agence/search.html', context)