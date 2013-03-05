#!/bin/bash

while [ 1 -eq 1 ]
do
  node_modules/testacular/bin/testacular start test/testacular-e2e.conf.js
  sleep 1
done
