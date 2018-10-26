#!/bin/bash

for file in `find node_modules/quasar-framework/src/components -name index.js`
do
    dir="$(dirname $file)/"
    awk -v dir=${dir#node_modules/} '/^import Q/ {sub(/\.\//, dir); print; print "Vue.component(" $2 ".name, " $2 ")\n"}' $file
done
