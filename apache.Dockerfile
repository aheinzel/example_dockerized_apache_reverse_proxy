FROM alpine:latest

RUN apk add --no-cache apache2

RUN sed -i -r 's@^ *(ErrorLog )[^ ]+@\1/dev/stderr\2@' /etc/apache2/httpd.conf
RUN sed -i -r 's@^ *(CustomLog )[^ ]+@\1/dev/stderr\2@' /etc/apache2/httpd.conf

EXPOSE 80

WORKDIR /

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


