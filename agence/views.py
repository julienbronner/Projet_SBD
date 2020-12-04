from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse

def index(request):
    template = loader.get_template('agence/index.html')
    return HttpResponse(template.render(request=request))

def accueil(request):
    message = "Bienvenue sur le site"
    return message