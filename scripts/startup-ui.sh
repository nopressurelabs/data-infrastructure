#!/bin/sh
sleep 5 && cd /web;
npm install && bower install --allow-root;
ember build;
