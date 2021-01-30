FROM nginx

LABEL name="eComm Application" \
	  description="Ecommerce application by Saumyasree Banerjee" \
	  version="1.0" \
	  creationDate="16th JAN 2021"

LABEL io.k8s.display-name="Angular, Nginx Server Image" \
	  io.k8s.description="Nginx server image with angular 8 code" \
	  io.openshift.expose-services="8080:http" \
	  io.openshift.tags="angular, nginx"

RUN rm -rf /usr/share/nginx/html/*.html && \
	sed -i "s/listen       80/listen       8080/g" /etc/nginx/conf.d/default.conf && \
	chgrp -R 0 /var/cache/ /var/log/ /var/run/ && \
	chmod -R g=u /var/cache/ /var/log/ /var/run/

COPY eCommWeb /usr/share/nginx/html

EXPOSE 8080

USER 1001

ENTRYPOINT ["nginx", "-g", "daemon off;"]
