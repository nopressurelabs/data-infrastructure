#!/bin/sh
sleep 5 && cd /api && bundle && bundle exec skylight setup $SKYLIGHT && rake db:create db:migrate db:seed RAILS_ENV=$RAILS_ENV;
rm -f /api/tmp/pids/*.pid || true;
bundle exec puma -C /api/config/puma.rb;
