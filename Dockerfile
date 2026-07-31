FROM nginx:1.30.4-alpine
COPY public/ /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/aross.studio.conf
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
