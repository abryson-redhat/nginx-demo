FROM registry.access.redhat.com/ubi9/nginx-120

ENV NGINX_VERSION=1.20

USER root

# Add application sources
ADD test-app/nginx-cfg/nginx.conf "${NGINX_CONF_PATH}"
#ADD test-app/nginx-default-cfg/*.conf "${NGINX_DEFAULT_CONF_PATH}"
#ADD test-app/nginx-cfg/*.conf "${NGINX_CONFIGURATION_PATH}"
#ADD test-app/*.html .

#CHOWN -R 1001:0 ./test-app

USER 1001

# Run script uses standard ways to run the application
CMD nginx --with-debug -g "daemon off;"
