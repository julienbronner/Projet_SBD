from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse
from .models import train

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