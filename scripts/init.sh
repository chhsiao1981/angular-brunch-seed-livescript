#!/bin/bash

LIB_PYRAMID="lib/python3.3/site-packages/pyramid-1.4-py3.3.egg/pyramid"
if [ ! -d "${LIB_PYRAMID}" ]
then
  LIB_PYRAMID="lib/python3.3/site-packages/pyramid"
fi
  
rm -rf node_modules
npm install

filename=node_modules/jade-brunch/vendor/runtime.js
sed 's/^jade = /window.jade = /g' ${filename} > ${filename}.tmp
mv ${filename}.tmp ${filename}

filename=node_modules/LiveScript-brunch/vendor/prelude-browser-0.6.0.js
sed 's/^  exports = {};/  var exports = {};/g' ${filename} > ${filename}.tmp
mv ${filename}.tmp ${filename}

if [ "${VIRTUAL_ENV}" == "" ]
then
  exit 0
fi

PCREATE_PY="${VIRTUAL_ENV}/${LIB_PYRAMID}/scripts/pcreate.py"
is_pcreate_output_dir=`grep -P "\-d" ${PCREATE_PY}`
if [ "${is_pcreate_output_dir}" == "" ]
then
  echo "to patch pcreate.patch"
  patch ${PCREATE_PY} < scripts/pcreate.patch
fi

is_pcreate_output_dir2=`pcregrep -M "else:\s*output_dir = os\.path\.abspath\(os\.getcwd\(\)\)" ${PCREATE_PY}`
if [ "${is_pcreate_output_dir}" == "" ]
then
  echo "to patch pcreate2.patch"
  patch ${PCREATE_PY} < scripts/pcreate2.patch
fi

COPYDIR_PY="${VIRTUAL_ENV}/${LIB_PYRAMID}/scaffolds/copydir.py"
is_copydir_overwrite=`grep -P "interactive=interactive, overwrite=overwrite" ${COPYDIR_PY}`
if [ "${is_copydir_overwrite}" == "" ]
then
  echo "to patch copydir.patch"
  patch ${COPYDIR_PY} < scripts/copydir.patch
fi
