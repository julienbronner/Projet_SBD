from django.shortcuts import render, get_object_or_404
from .models import reduction, client, train, voiture, place, billet, reservation

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
    }
    # if request.method == 'POST':
    #     form = ContactForm(request.POST, error_class=ParagraphErrorList)
    #     if form.is_valid():
    #         email = form.cleaned_data['email']
    #         name = form.cleaned_data['name']
    #         try:
    #             with transaction.atomic():
    #                 contact = Contact.objects.filter(email=email)
    #                 if not contact.exists():
    #                     # If a contact is not registered, create a new one.
    #                     contact = Contact.objects.create(
    #                         email=email,
    #                         name=name
    #                     )
    #                 else :
    #                     contact = contact.first()

    #                 # If no album matches the id, it means the form must have been tweaked
    #                 # so returning a 404 is the best solution.
    #                 album = get_object_or_404(Album, id=album_id)
    #                 booking = Booking.objects.create(
    #                     contact=contact,
    #                     album=album
    #                 )

    #                 # Make sure no one can book the album again.
    #                 album.available = False
    #                 album.save()
    #                 context = {
    #                     'album_title': album.title
    #                 }
    #                 return render(request, 'store/merci.html', context)

    #         except IntegrityError:
    #             form.errors['internal'] = "Une erreur interne est apparue. Merci de recommencer votre requête."

    # else:
    #     # GET method. Create a new form to be used in the template.
    #     form = ContactForm()

    # context['form'] = form
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