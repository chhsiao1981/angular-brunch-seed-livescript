#!/bin/bash

lsc -cb test/karma-e2e.conf.ls
node_modules/karma/bin/karma start test/karma-e2e.conf
