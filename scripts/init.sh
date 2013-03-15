#!/bin/bash

rm -rf node_modules
npm install

angular_brunch_seed_livescript_current_dir=`pwd`

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

is_using_pyramid=`./scripts/check_using_pyramid.pl "${VIRTUAL_ENV}" ${current_dir}`

if [ "${is_using_pyramid}" == "false" ]
then
  echo "[WARNING] not is using pyramid or VIRTUAL_ENV is not set properly"
  exit 0
fi

#LIB_PYRAMID
LIB_PYRAMID="${VIRTUAL_ENV}/lib/python3.3/site-packages/pyramid-1.4-py3.3.egg/pyramid"
if [ ! -d "${LIB_PYRAMID}" ]
then
  LIB_PYRAMID="${VIRTUAL_ENV}/lib/python3.3/site-packages/pyramid"
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

cd ..
python setup.py egg_info
cd ${angular_brunch_seed_livescript_current_dir}
