#!/bin/bash

lsc -cb test/karma-unit.conf.ls
node_modules/karma/bin/karma start test/karma-unit.conf
