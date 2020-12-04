from django.contrib import admin
from .models import reduction, client, train, voiture, place, billet, reservation
# Register your models here.


@admin.register(reduction)
class reductionAdmin(admin.ModelAdmin):
    pass

@admin.register(client)
class clientAdmin(admin.ModelAdmin):
    pass

@admin.register(train)
class trainAdmin(admin.ModelAdmin):
    pass

@admin.register(voiture)
class voitureAdmin(admin.ModelAdmin):
    pass

@admin.register(place)
class placeAdmin(admin.ModelAdmin):
    pass

@admin.register(billet)
class billetAdmin(admin.ModelAdmin):
    pass

@admin.register(reservation)
class reservationAdmin(admin.ModelAdmin):
    pass
