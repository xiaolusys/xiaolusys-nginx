from nginx
add data /data
run mkdir -p /data/verify
run mkdir -p /data/log

add .htpasswd /etc/nginx/
add nginx.conf /etc/nginx/

add default.conf /etc/nginx/conf.d/
add site.conf /etc/nginx/conf.d/
add admin.conf /etc/nginx/conf.d
add sentry.conf /etc/nginx/conf.d/
add staging.conf /etc/nginx/conf.d/
add staging2.conf /etc/nginx/conf.d/
add django18.conf /etc/nginx/conf.d/
add gitlab.conf /etc/nginx/conf.d/
add flower.conf /etc/nginx/conf.d/
add forum-staging.conf /etc/nginx/conf.d/
add forum.conf /etc/nginx/conf.d/
add warden.conf /etc/nginx/conf.d/
add analytics.conf /etc/nginx/conf.d/
