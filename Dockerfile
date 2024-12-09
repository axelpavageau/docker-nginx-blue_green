FROM nginx:1.27.3

ARG COLOR
ARG COLOR_CODE

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY content.json /usr/share/nginx/html/

RUN sed -i 's/{{COLOR}}/'"$COLOR"'/g' /usr/share/nginx/html/index.html
RUN sed -i 's/{{COLOR}}/'"$COLOR"'/g' /usr/share/nginx/html/content.json

RUN /usr/sbin/nginx -t

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1
