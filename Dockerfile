FROM nginx

RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

ADD . /database
ADD . /php
ADD . /php/exoDocker.php
ADD . /sql
ADD . /php/exoDocker.php


CMD npm run start

COPY ["./adds/index.html", "/usr/share/debian/html/"]
COPY ["./adds/index.html", "/usr/share/mysql/html/"]
COPY ["./adds/index.html", "/usr/share/mariadb/html/"]
COPY ["./adds/index.html", "/usr/share/phpmyadmin/html/"] 
COPY ["./adds/index.html", "/usr/share/httpd/html/"]
