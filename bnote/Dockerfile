FROM nginx:alpine
ADD bnote.cn.conf /etc/nginx/conf.d/
COPY public /www/bnote

WORKDIR /www

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx" "-g" "daemon off;"]
