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
echo "[INFO] pcreate"

#templates
echo "to link templates"
cd __/app
ln -s ../../templates ./
cd ../..

#setup.py
echo "[INFO] to setup.py"
cp scripts/setup.py __/app

cd __/app
python setup.py egg_info
python setup.py develop

cd ${angular_brunch_seed_livescript_current_dir}
source __/bin/activate
