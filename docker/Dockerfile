 from debian:buster-slim

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/home/cocorico \
    HOME=/home/cocorico \
    HOST_UID=1000

RUN apt-get update
RUN apt-get install -y \
        php7.3 \
        php7.3-curl \
        php7.3-zip \
        php7.3-mbstring \
        php7.3-xml \
        php-dom \
        php-mongodb \
        php-mysql


RUN apt-get install -y \
        curl \
        git \
        default-mysql-client \ 
        unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo 
RUN  groupadd cocorico && useradd -g cocorico --create-home cocorico

COPY . /cocorico
WORKDIR cocorico

COPY ./docker/parameters.yml /cocorico/app/config/parameters.yml
CMD ["bash"]
