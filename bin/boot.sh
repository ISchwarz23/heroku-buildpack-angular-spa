#!/usr/bin/env bash

export APP_ROOT_DIR=$1

ruby $HOME/config/htpasswd.rb
erb $HOME/config/nginx.conf.erb > $HOME/config/nginx.conf

mkdir -p $HOME/logs/nginx
touch $HOME/logs/nginx/access.log $HOME/logs/nginx/error.log

(tail -f -n 0 $HOME/logs/nginx/*.log &)
exec $HOME/vendor/nginx/sbin/nginx -p $HOME -c $HOME/config/nginx.conf
