#!/bin/bash

LIB_PYRAMID="lib/python3.3/site-packages/pyramid-1.4-py3.3.egg/pyramid"
if [ ! -d "${LIB_PYRAMID}" ]
then
  LIB_PYRAMID="lib/python3.3/site-packages/pyramid"
fi
  
rm -rf node_modules
npm install

#jade 
echo "[INFO] to jade"
filename=node_modules/jade-brunch/vendor/runtime.js
sed 's/^jade = /window.jade = /g' ${filename} > ${filename}.tmp
mv ${filename}.tmp ${filename}

#livescript-prelude
echo "[INFO] to livescript-prelude"
filename=node_modules/LiveScript-brunch/vendor/prelude-browser-0.6.0.js
sed 's/^  exports = {};/  var exports = {};/g' ${filename} > ${filename}.tmp
mv ${filename}.tmp ${filename}

#PYRAMID
echo "[INFO] to init pyramid"

current_dir=`pwd`
is_using_pyramid=`./scripts/check_using_pyramid.pl "${VIRTUAL_ENV}" ${current_dir}`

if [ "${is_using_pyramid}" == "false" ]
then
  echo "[WARNING] not is using pyramid or VIRTUAL_ENV is not set properly"
  exit 0
fi

#pcreate.py
echo "[INFO] to pcreate.py"
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

#copydir.py
echo "[INFO] to copydir.py"
COPYDIR_PY="${VIRTUAL_ENV}/${LIB_PYRAMID}/scaffolds/copydir.py"
is_copydir_overwrite=`grep -P "interactive=interactive, overwrite=overwrite" ${COPYDIR_PY}`
if [ "${is_copydir_overwrite}" == "" ]
then
  echo "to patch copydir.patch"
  patch ${COPYDIR_PY} < scripts/copydir.patch
fi

#templates
echo "to cp -R templates/* ../templates"
mkdir -p ../templates
cp -R templates/* ../templates

#setup.py
echo "[INFO] to setup.py"
SETUP_PY="../setup.py"
is_pyramid_scaffold=`grep pyramid.scaffold ${SETUP_PY}`
if [ "${is_pyramid_scaffold}" == "" ]
then
  echo "to do_setup_py.pl"
  cp ${SETUP_PY} ${SETUP_PY}.orig
  cat ${SETUP_PY} | /usr/bin/perl scripts/do_setup_py.pl > ${SETUP_PY}.tmp
  mv ${SETUP_PY}.tmp ${SETUP_PY}
fi
