FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli
RUN apt-get update
RUN apt-get install -y curl git unzip
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN apt-get update
RUN apt-get install -y nginx

WORKDIR /var/www/html/dtvthe
EXPOSE 80

ADD . /var/www/html/dtvthe

RUN cd /var/www/html/dtvthe &&  composer install && chmod -R 777 storage/

RUN cp /var/www/html/dtvthe/site.example /etc/nginx/sites-available/default
# RUN ln -s /etc/nginx/sites-available/hihi.dev /etc/nginx/sites-enabled/
RUN service php7.3-fpm start
RUN service php7.3-fpm restart
RUN service nginx start
RUN service nginx restart

# ENTRYPOINT [ "start" ]
# CMD [ "/start.sh" ]
CMD ["nginx", "-g", "daemon off;"]
