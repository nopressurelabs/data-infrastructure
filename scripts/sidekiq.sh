#!/bin/sh
sleep 5 && cd /fablabs;
ls;
bundle exec sidekiq -e $RAILS_ENV -C config/sidekiq.yml;
