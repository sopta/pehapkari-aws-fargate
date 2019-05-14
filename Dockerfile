FROM php:7.3-apache

RUN a2enmod rewrite

COPY . /var/www/html
