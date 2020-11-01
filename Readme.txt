Auteur : Ulysse Perret
Dernière version : V1.8
Date de création : Samedi 12 septembre 2020
Date de modification : Dimanche 1 novembre

Structure du projet

Sur la racine sont présent
Les fichiers :
* Readme.txt : fichier que vous lisez actuellement
* docker-compose.yml -> décrivant l’orchestration de l’exécution des conteneurs.
* Dockerfile -> description d’image ;
* Exercice_Docker.pdg -> Sujet

Les dossiers sont:
database : tout ce qui concerne la database
php : les pages web php
sql: l'exportation de la base de données
Version : les versions précédentes
adds: le fichier index.html

Prérequis :
- Avoir Docker installer
Aide pour l'installation de docker
https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211390-installez-docker-sur-votre-poste
installe docker sur window :: https://docs.docker.com/docker-for-windows/install/
installe docker sur mac : https://docs.docker.com/docker-for-mac/install/
install ubuntu :  https://docs.docker.com/engine/install/ubuntu/
install docker sur Windows Home : https://docs.docker.com/docker-for-windows/install-windows-home/

Étape installation du projet:
- lancer le terminal 
- Aller grâce à pwd sur l'architecture et aller au dossier exercice  où se trouve ce fichier et le Dockerfile (racine)
 
)
- Sur le terminal lancer : docker-compose up
- ajouter la base de données SQL ProjetSQL.sql (dans le dossier sql)
-aller sur le localhost, Login : root, password : test;
Rappel  adresse sql : http://localhost:8282/db_structure.php?server=1&db=projetSql

Une fois fini vous pouvez nettoyer les images docker avec docker system prune
rappel :  docker rm -f $(docker ps -aq) -> Pour forcer a quitter les porcet
ps : chemin absolu/pwd : /Users/ulysse/Desktop/Formation et Cours/Formation dev/Cergy pontois/LP/Racouci Exo LP/Docker/UP-Docker-Exo


Changelog - Avancement et Aide pour suivi de l'exercice

V8 - 1 novembre
- reprise/relection
- correction de fautes orthographe
- comprehension du bloquage / plus de connexion mysql (juste modificaiton du Readme)

V.7 -16-17 octobre
Prise en compte mail
-> Metter sur Github
https://github.com/UlyssePerret/UP-Docker-Exo
-> Envi Mise sur hub docker 
https://hub.docker.com/repository/docker/ulysseperret/updockerexo
Mise à jour Readme

Envoie mail/Discord
 
V.1.6
Reprise du projet
Test Dockerfile/
Docker-compose.yml

- Question blocage - 
Comment mettre un Dockerfille dans le docker hub?
Je ne comprends le système de tag et comment pousser sur le docker hub
je bloque sur la mise en place du serveur httpd.  
Comment utiliser EXPOSE et les Volumes? Quelles sont leurs utilités?
J'ai du mal a construire et crée des Dockerfiles, il a-t-il d'autre site pour m'aider à écrire, notamment en termes de syntaxe et compréhension

Création d'une image Hub et bien 

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
Le problème c'est que je vois pas si c'est pertinent de faire ainsi, j'ai fait ceci selon le cours Open Classroom pour l'usage 

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

V.1.5 dimanche 20 septembre -
Relecture du Readme.txt avant demande
'demande pour avoir avis'
- Envois d'un mail au prof
- Envoi d'un message sur discord 
Stockage de tous les éléments, de la base de travail dans le dossier V1.4

V1.4 - Dimanche 20 septembre - Aprem
Creation register

test de mettre sur le hub
ulysseperret/exo1dockerv14
Docker Hub -> terminal
docker push ulysseperret/exo1dockerv14:tagname ->NO
Terminal -> Hub ?
formexo1_db_1 ?
 docker push ulysseperret/exo1dockerv14:tagname -> NO
Hub tutorial?
docker tag ulysseperret:tagname new-repo:tagname  -> NO

Point de blocage - ASK PEOPLE OU Recul

Stockage de tous les éléments, de la base de travail dans le dossier V1.4

V 1.3 - Dimanche 20 septembre - Matin
- Installer un serveur frontal HTTP pour les pages PHP ?
Rappel : Docker fait que des environnement locaux
-> Le serveur MYSQL est ok du coup
il faut faire un serveur HTTP pour le service PHP sur le docker-compose.yml
Idee : Ajouter sur docker-compose.yml le serveur HTTP

Amélioration du Readme.txt
Pour httpd
- test docker pull httpd : ok
- test ajout sur Dokerfile  : pas de message d'erreur - port ne marche pas
- test docker-compose.yml : Non fait

Modification du Dokerfile - modification avec le cours openclassroom
debian:9 -> non pas pertinent on se remet sur nginx
Nginx permet d'avoir des process tels qu’apaches 
Modification du docker-compos.yml  - modification avec le cours openclassroom
création du fichier .dockerignore (voir avec ls -a)

Test travaille sur Dokerfile

Stockage de tous les éléments, de la base de travail dans le dossier V1.3

V 1.2 - Dimanche 20 septembre
Création du dossier version 
Stockage des fichiers actuels pour sauvegarde et base de travail (nommée V1.1 - zip)
Décision de faire un Readme.txt pour noter et ajouter les améliorations, ajouts et changement du projet pour la formation Docker.
Il s'agit fichier que vous lisez actuellement.

Création du Readme.txt 
	- Ajout de la structure du projet
	- Ajout du prérequis : avoir docker et docker compose installer
	- Ajout Étape installation
	- Ajout du changelog actuel
Test état du projet actuel
Lancement sur terminal
- Aller sur le fichier
- Mettre nginx et node : 
  - docker pull nginx 
  - docker pull node
- installer pip : sudo easy_install pip
- lancer le docker compose : docker-compose up
se connecter sur l'adresse : http://localhost:8282/index.php
- Remarquer que la base de données n'a pas été mise, demander à la mettre sur l'installation

Minimum attendu pour V 2.0
- 1 Serveur frontal HTTP pour service PHP interprété : À FAIRE ? (se renseigner)
- 1 serveur de base de données MYSQL ou MariaDB en charge de la persistance des données : OK (local)
- 1 fichier php : OK
- 1 fichier dockerfile : OK
- 1 fichier docker-compose : OK

Étape à faire
- Installer un serveur frontal HTTP pour les pages PHP
-> passer en v 2.0 quand fini

Amélioration éventuelle
- Installer serveur de base de données MYSQL ou MariaDB si possible hébergement
- Faire en sorte que l'installation de la base de données soit sur le fichier Dokerfile

Stockage de tous les éléments, de la base de travail dans le dossier V1.2
-> Passe en version 1.3

V 1.1 _ Mardi 15 - mercredi 16
Cours SQL
- Creation du fichier projetSQL.SQL
- Création de la base projetSQL et l'exporter pour sauvegarde
- Test de ligne de commandes sur la base de données (utilisation de la base, test jointures, recherche)

V 1.0 - Samedi 12 et 13
-> Premières réflexions sur l'exercice Docker
-> Création du répertoire FormExo1
-> Ajout du sujet Exercice_Docker.pdg
-> Création du fichier Dokerfile
-> Création du fichier docker-compose.yml
-> Demande de conseil des étapes à suivre fmichaud@9fevrier.com le 15/09/2020
