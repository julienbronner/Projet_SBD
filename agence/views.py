from django.shortcuts import render, get_object_or_404, redirect
from .models import reduction, client, train, voiture, place, billet, reservation
from django.db import transaction, IntegrityError
from .forms import ClientForm, ParagraphErrorList

def index(request):
    # template = loader.get_template('agence/index.html')
    context = {}
    return render(request, 'agence/index.html', context)
    # return HttpResponse(template.render(request=request))

def listing(request):
    billets = billet.objects.all()
    context = {
        'trains': billets
    }
    return render(request, 'agence/all_train.html', context)

def detail(request, numero_billet):
    billet1 = get_object_or_404(billet, numero_billet=numero_billet)
    # billet1 = billet.objects.filter(numero_billet=numero_billet)[0]
    context = {
        'depart_ville': billet1.depart_ville,
        'arrivee_ville': billet1.arrivee_ville,
        'date_depart': billet1.depart_date,
        'date_arrivee': billet1.arrivee_date,
        'numero_billet': billet1.numero_billet,
    }
    if request.method == 'POST':
        form = ClientForm(request.POST, error_class=ParagraphErrorList)
        if form.is_valid():
            email = form.cleaned_data['email']
            name = form.cleaned_data['name']
            firstname = form.cleaned_data['firstname']
            preference = form.cleaned_data['preference']
            try:
                with transaction.atomic():
                    client1 = client.objects.filter(email=email)
                    if not client1.exists():
                        context['message'] = "Vous n'êtes pas client chez nous"
                        render(request, 'agence/desole.html', context)
                        # return redirect(request.META['HTTP_REFERER'])# penser à rajouter un message
                    else :
                        client1 = client1.first()

                    # If no album matches the id, it means the form must have been tweaked
                    # so returning a 404 is the best solution.
                    voiture1 = voiture.objects.filter(numero_train=billet1.numero_train)
                    numero_place = None
                    numero_voiture = None
                    for voiture_unique in voiture1:
                        place1 = place.objects.filter(numero_de_serie_voiture = voiture_unique.numero_de_serie_voiture)
                        for place_unique in place1:
                            if place_unique.position == preference:
                                numero_place = place_unique.numero_place
                                numero_voiture = place_unique.numero_de_serie_voiture
                                numero_train = voiture_unique.numero_train
                                break
                    if not numero_place:
                        context['message'] = "Nous n'avons pas trouvé de place satisfaisant vos préférences"
                        render(request, 'agence/desole.html', context)
                        # return redirect(request.META['HTTP_REFERER']) # penser à rajouter un message

                    reservation1 = reservation.objects.create(
                        numero_reservation=1,
                        numero_billet=billet1,
                        numero_client=client1,
                        numero_place=numero_place,
                        numero_voiture=numero_voiture,
                        confirmation=False,
                    )

                    context['numero_place'] =numero_place
                    context['numero_voiture'] =numero_voiture
                    context['preference'] =preference
                    context['numero_train'] =numero_train

                    return render(request, 'agence/confirmation.html', context)

                    # try:
                    #     client1 = client.objects.filter(email=email)
                    #     if not client1.exists():
                    #         context['message'] = "Vous n'êtes pas client chez nous"
                    #         render(request, 'agence/desole.html', context)
                    #         # return redirect(request.META['HTTP_REFERER'])# penser à rajouter un message
                    #     else :
                    #         client1 = client1.first()

                    #     # If no album matches the id, it means the form must have been tweaked
                    #     # so returning a 404 is the best solution.
                    #     voiture1 = voiture.objects.filter(numero_train=billet1.numero_train)
                    #     numero_place = None
                    #     numero_voiture = None
                    #     for voiture_unique in voiture1:
                    #         place1 = place.objects.filter(numero_de_serie_voiture = voiture_unique.numero_de_serie_voiture)
                    #         for place_unique in place1:
                    #             if place_unique.position == preference:
                    #                 numero_place = place_unique.numero_place
                    #                 numero_voiture = place_unique.numero_de_serie_voiture
                    #                 numero_train = voiture_unique.numero_train
                    #                 break
                    #     if not numero_place:
                    #         context['message'] = "Nous n'avons pas trouvé de place satisfaisant vos préférences"
                    #         render(request, 'agence/desole.html', context)
                    #         # return redirect(request.META['HTTP_REFERER']) # penser à rajouter un message

                    #     reservation1 = reservation.objects.create(
                    #         numero_reservation=1,
                    #         numero_billet=billet1,
                    #         numero_client=client1,
                    #         numero_place=numero_place,
                    #         numero_voiture=numero_voiture,
                    #         confirmation=False,
                    #     )

                    #     context['numero_place'] =numero_place
                    #     context['numero_voiture'] =numero_voiture
                    #     context['preference'] =preference
                    #     context['numero_train'] =numero_train

                    #     return render(request, 'agence/confirmation.html', context)
                    # except:
                    #     render(request, 'agence/desole.html', context)



            except IntegrityError:
                form.errors['internal'] = "Une erreur interne est apparue. Merci de recommencer votre requête."

    else:
        # GET method. Create a new form to be used in the template.
        form = ClientForm()

    context['form'] = form
    # context['errors'] = form.errors.items()
    return render(request, 'agence/detail.html', context)

def search(request):
    query_depart = request.GET.get('query_depart')
    query_arrivee = request.GET.get('query_arrivee')
    query_date = request.GET.get('query_date')
    if query_date:
        year, month, day = query_date.split('-')
        title = f"Trajets {query_depart}-{query_arrivee} le {day}/{month}/{year}"
        if (not query_depart and not query_arrivee):
            trains = billet.objects.all()
        elif not query_arrivee:
            trains = billet.objects.filter(depart_ville__icontains=query_depart, 
                        depart_date__year=str(year), 
                        depart_date__month=str(month), 
                        depart_date__day=str(day))
        elif not query_depart:
            trains = billet.objects.filter(arrivee_ville__icontains=query_arrivee, 
                        depart_date__year=str(year), 
                        depart_date__month=str(month), 
                        depart_date__day=str(day))
        else:
            trains = billet.objects.filter(depart_ville__icontains=query_depart, arrivee_ville__icontains=query_arrivee, 
                        depart_date__year=str(year), 
                        depart_date__month=str(month), 
                        depart_date__day=str(day))

            
    else:
        if (not query_depart and not query_arrivee):
            trains = billet.objects.all()
        elif not query_arrivee:
            trains = billet.objects.filter(depart_ville__icontains=query_depart)
        elif not query_depart:
            trains = billet.objects.filter(arrivee_ville__icontains=query_arrivee)
        else:
            trains = billet.objects.filter(depart_ville__icontains=query_depart, arrivee_ville__icontains=query_arrivee)
        title = f"Trajets {query_depart}-{query_arrivee}"
    context = {
        'trains': trains,
        'title': title
    }
    return render(request, 'agence/search.html', context)
