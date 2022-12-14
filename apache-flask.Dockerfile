FROM alpine:latest

RUN apk add --no-cache apache2 apache2-mod-wsgi python3
RUN python3 -m ensurepip
RUN pip3 --no-cache-dir install flask

RUN sed -i -r 's@^ *(ErrorLog )[^ ]+@\1/dev/stderr\2@' /etc/apache2/httpd.conf
RUN sed -i -r 's@^ *(CustomLog )[^ ]+@\1/dev/stderr\2@' /etc/apache2/httpd.conf
RUN echo -e "WSGIScriptAlias / /var/flask-app/app.wsgi application-group=%{GLOBAL} process-group=%{GLOBAL} \n\
<Directory /var/flask-app>\n\
	Options FollowSymLinks\n\
	AllowOverride None\n\
	Require all granted\n\
</Directory>" >> /etc/apache2/httpd.conf


EXPOSE 80

WORKDIR /var/flask-app

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


