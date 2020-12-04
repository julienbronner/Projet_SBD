from django.db import models

# Create your models here.
class voiture(models.Model):
    numero_de_serie_voiture = models.IntegerField(null=False)
    numero_train = models.IntegerField(default=0)
    nombre_place_dispo = models.IntegerField(null=False)

class train(models.Model):
    numero_train = models.IntegerField(null=False)
    depart_ville = models.CharField(null=False)
    arrivée_ville = models.CharField(null=False)

class reservation(models.Model):
	numero_reservation = models.IntegerField(null=False)
	numero_billet = models.IntegerField(null=False)
	numero_client = models.IntegerField(null=False)
	numero_place = models.IntegerField(null=False)
	numero_voiture = models.IntegerField(null=False)
	confirmation = models.BooleanField(null=False)
	prix_total=models.DecimalField(null=False)

class reduction(models.Model):
    numero_reduction = models.IntegerField(null=False)
    type_reduction = models.CharField(null=False)
    pourcentage = models.IntegerField(null=False)

class place(models.Model):
    numero_de_serie_voiture = models.IntegerField(null=False)
    numero_place = models.IntegerField(null=False)
    position = models.CharField(null=False)

class client(models.Model):
    numero_client= models.IntegerField(null=False)
    nom = models.CharField(null=False)
    prenom = models.CharField(null=False)
    confirmation = models.BooleanField(null=False)
	majorite = models.BooleanField(null=False)
	numero_reduction = models.IntegerField(default=0)

class billet(models.Model):
	numero_billet = models.IntegerField(null=False)
	numero_train = models.IntegerField(null=False)
	agence = models.CharField(null=False)
	prix_billet=models.DecimalField(null=False)
	depart_ville = models.CharField(null=False)
	depart_date = models.DateTimeField(null=False)
	depart_heure = models.TimeField(null=False)
	arrivee_ville = models.CharField(null=False)
	arrivee_date = models.DateTimeField(null=False)
	arrivee_heure = models.TimeField(null=False)



