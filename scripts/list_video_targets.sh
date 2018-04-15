#!/bin/sh

for f in data/edu/phys/video/*.psv; do
  CATEGORY=`echo ${f} | sed "s,.*/\(.*\)\.psv,\1,"`
  sed "s@^\([^\|]*\)\|.*@${CATEGORY}/\1.html@" ${f}
done
