Avoir Docker d'installer

Faire `docker-compose up`

Il faudra faire créer l'utilisateur admin, dans le docker du web faire `./manage.py createsuperuser`
Pour ça il faudra peut être utiliser https://stackoverflow.com/questions/19425857/env-python-r-no-such-file-or-directory ou  `dos2unix` pour changer le fichier *manage.py* 

Faire `cat dump_final.sql | docker exec -i your-db-container psql -U postgres` pour remplir la base de données
Si marche pas faire : `iconv -f utf-16 -t utf-8 dump_final.sql > dump_final_v2.sql`