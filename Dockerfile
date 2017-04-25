from nginx
add data /data
run mkdir -p /data/verify
run mkdir -p /data/log

add .htpasswd /etc/nginx/
add nginx.conf /etc/nginx/

add conf.d /etc/nginx/conf.d
