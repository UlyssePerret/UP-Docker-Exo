Auteur : Ulysse Perret
Dernier version : V1.7
Date de création : Samedi 12 Septembre 2020
Date de modification : samedi 17 octobre

Structure du projet

Sur la racine sont present
Les fichiers :
* Readme.txt : fichier que vous lisez actuellement
* docker-compose.yml -> décrivant l’orchestration de l’exécution des containeurs.
* Dockerfile -> description d’image ;
* Exercice_Docker.pdg -> Sujet

Les dossiers sont:
database : tout ce qui concerne la database
php : les pages web phpo
sql: l'exportation de la base de donné
Version : les versions précédente

Prerequis :
- Avoir Docker installer
Aide pour l'installation de docker
https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211390-installez-docker-sur-votre-poste
install docker sur window :: https://docs.docker.com/docker-for-windows/install/
install docker sur mac : https://docs.docker.com/docker-for-mac/install/
install ubuntu :  https://docs.docker.com/engine/install/ubuntu/
install docker sur Windows Home : https://docs.docker.com/docker-for-windows/install-windows-home/

Etape installation du proejt:
- lancer le terminal 
- Aller grace à pwd sur l'archicture et aller au dossier exercice  où se trouve ce fichier et le Dockerfile (racine)
- Sur le terminal lancer : docker-compose up
- ajouter la base de données SQL ProjetSQL.sql (dans le dossier sql)
-aller sur le localhost, Login : root, passwort : test;
Rappel  adresse sql : http://localhost:8282/db_structure.php?server=1&db=projetSql

Une fois fini vous pouvez nettoyer les images docker avec docker system prune
rappel :  docker rm -f $(docker ps -aq) -> Pour forcer a quitter les porcet
ps : chemin absolu/pwd : /Users/ulysse/Desktop/Formation et Cours/Formation dev/Cergy pontois/LP/Racouci Exo LP/Docker/UP-Docker-Exo

Rappel plu

Changelog - Avancement et Aide pour suivi de l'exercice
V.7 -16-17 octobre
Prise en compte mail
-> Metter sur Github
https://github.com/UlyssePerret/UP-Docker-Exo
-> Test mise sur hub docker 
(En cours

Test build
 
V.1.6
Reprise du projet
Test Dockerfile/
Docker-compose.yml

- Question bloquage - 
Comment mettre un Dockerfille dans le docker hub?
Je ne comprend le systéme de tag et comment pousser sur le docker hub
je bloque sur la mise en place du serveur httpd.  
Comment Utiliser EXPOSE et les Volume? quels sont leur utilité?
J'ai du mal a consctruire et crée des Dockerfiles, il a t'il d'autre site pour m'aider à écrire, Notamment en terme de synthaxe et comprehension

Création d'un image Hub et bien 

Actuellement j'ai mis dans le Dockerfille ceci :

'
FROM nginx

RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

ADD . /database
ADD . /php
ADD . /sql

WORKDIR .

CMD npm run start

COPY ["./adds/index.html", "/usr/share/debian/html/"]
COPY ["./adds/index.html", "/usr/share/mysql/html/"]
COPY ["./adds/index.html", "/usr/share/mariadb/html/"]
COPY ["./adds/index.html", "/usr/share/phpmyadmin/html/"] 
COPY ["./adds/index.html", "/usr/share/httpd/html/"] 
'
Le probleme c'est que je vois pas si c'est pertinent de faire ainsi, j'ai fait ceci selon le cours Open Classroom pour l'usage 

docker-compose.yml
'
version: "2"
services:
  db:
      image: mariadb
      environment:
          - MYSQL_ROOT_PASSWORD=test
          - MYSQL_DATABASE=radio
      volumes:
          - ./database:/var/lib/mysql
  phpmyadmin:
      image: phpmyadmin/phpmyadmin
      container_name: phpmyadmin
      restart: always
      ports:
          - 8282:80
      links:
          - db
'
Modif Readme

V.1.5 Dimanche 20 Septembre -
Relecture du Readme.txt avant demande
'demande pour avoir avis'
- Envois d'un mail au prof
- Envoi d'un message sur discord 
Stockage de tout les éléments, de la base de travaille dans le dosseir V1.4

V1.4 - Dimanche 20 Septembre - Aprem
Creation register

test de mettre sur le hub
ulysseperret/exo1dockerv14
Docker Hub -> Terminal
docker push ulysseperret/exo1dockerv14:tagname ->NO
Terminal -> Hub ?
formexo1_db_1 ?
 docker push ulysseperret/exo1dockerv14:tagname -> NO
Hub tutorial?
docker tag ulysseperret:tagname new-repo:tagname  -> NO

Point de bloquage - ASK PEOPLE OU Recul

Stockage de tout les éléments, de la base de travaille dans le dosseir V1.4

V 1.3 - Dimanche 20 Septembre - Matin
- Installer un serveur frontal HTTP pour les pages PHP ?
Rappel : Docker fait que des environnement locaux
-> Le serveur MYSQL est ok du coup
il faut faire un serveur HTTP pour le service PHP sur le docker-compose.yml
Idee : Ajouter sur docker-compose.yml le serveur HTTP

Amelioration du Readme.txt
Pour httpd
- test docker pull httpd : ok
- test ajout sur Dokerfile  : pas de message d'erreur - port ne marche pas
- test docker-compose.yml : Non fait

Modification du Dokerfile - modificaiton avec le cours openclassroom
debian:9 -> non pas pertinent on se remet sur nginx
Nginx permet d'avoir des process tel que apache 
Modification du docker-compos.yml  - modificaiton avec le cours openclassroom
création du fichier .dockerignore (voir avec ls -a)

Test travaille sur Dokerfile

Stockage de tout les éléments, de la base de travaille dans le dosseir V1.3

V 1.2 - Dimanche 20 Septembre
Création du dossier version 
Stockage des fichiers actuelles pour sauvegarde et base de travaille (nommée V1.1 - zip)
Décision de faire un Readme.txt pour noter et ajouter les améliorations, ajouts et changement du projet pour la formation Docker.
Il s'agit fichier que vous lisez actuellement.

Création du Readme.txt 
	- Ajout du structure du porjet
	- Ajout du prerequis : avoir docker et docker compose installer
	- Ajout Etape installation
	- Ajout du changelog actuelle
Test état du projet actuelle
Lancement sur terminal
- Aller sur le fichier
- Mettre nginx et node : 
  - docker pull nginx 
  - docker pull node
- installer pip : sudo easy_install pip
- lancer le docker compose : docker-compose up
se connecter sur l'adresse : http://localhost:8282/index.php
- Remarquer que la base de donnée n'as pas été mise, demander à la mettre sur l'installation

Minimum attendu pour V 2.0
- 1 Serveur frontal HTTP pour service PHP intréprétées : A FAIRE ? (se renseigner)
- 1 serveur de base de donéne MYSQL ou MariaDB en charge de la persistance des donénes : OK (local)
- 1 fichier php : OK
- 1 fichier dockerfile : OK
- 1 fichier docker-compose : OK

Etape a faire
- Installer un serveur frontal HTTP pour les pages PHP
-> Passer en v 2.0 quand fini

Amelioration éventuelle
- Installer serveur de base de donéne MYSQL ou MariaDB si possible hebergement
- Faire en sorte que l'installation de la base de données soit sur le fichier Dokerfile

Stockage de tout les éléments, de la base de travaille dans le dosseir V1.2
-> Passe en version 1.3

V 1.1 _ Mardi 15 - Mercredi 16
Cours SQL
- Creation du fichier projetSQL.SQL
- Création de la base projetSQL et l'exporter pour sauvegarde
- Test de ligne de commandes sur la base de donnée (utilisation de la base, test jointures, recherche)

V 1.0 - Samedi 12 et 13
-> Premier reflexion sur l'exercice Docker
-> Création du repertoire FormExo1
-> Ajout du sujet Exercice_Docker.pdg
-> Création du fichier Dokerfile
-> Création du fichier docker-compose.yml
-> Demande de conseil des étapes à suivre fmichaud@9fevrier.com le 15/09/2020