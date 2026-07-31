FROM nginx:1.30.4-alpine
COPY public/ /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf && \
    sed -i 's|pid\s\+/run/nginx.pid;|pid /tmp/nginx.pid;|' /etc/nginx/nginx.conf && \
    sed -i 's|/var/log/nginx/error.log|/dev/stderr|' /etc/nginx/nginx.conf && \
    sed -i 's|/var/log/nginx/access.log|/dev/stdout|' /etc/nginx/nginx.conf && \
    mkdir -p /var/cache/nginx/client_temp \
             /var/cache/nginx/proxy_temp \
             /var/cache/nginx/fastcgi_temp \
             /var/cache/nginx/uwsgi_temp \
             /var/cache/nginx/scgi_temp && \
    chmod -R 755 /var/cache/nginx && \
    chown -R 101:101 /var/cache/nginx /etc/nginx/conf.d /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/aross.studio.conf
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
