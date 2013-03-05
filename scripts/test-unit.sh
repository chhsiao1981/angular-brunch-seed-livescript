#!/bin/bash

while [ 1 -eq 1 ]
do
  node_modules/testacular/bin/testacular start test/testacular-unit.conf.js
  sleep 1
done

