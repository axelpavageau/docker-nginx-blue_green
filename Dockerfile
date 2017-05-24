FROM nginx:latest
COPY nginx.conf /etc/nginx/
COPY index.html /usr/share/nginx/html/
COPY content.json /usr/share/nginx/html/
RUN /usr/sbin/nginx -t
CMD nginx -g 'daemon off;'
EXPOSE 80
