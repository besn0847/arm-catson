#!/bin/bash

if [ ! -f /bootstrap/.bootstrapped_cats ]
then
        mv /bootstrap/* /conf/
        echo 1 > /bootstrap/.bootstrapped_cats
fi

cd /conf/
while(true)
do
        python catson.py 
        sleep 5
done
