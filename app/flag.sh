#!/bin/bash

echo $FLAG > /flag.txt
chown glzjin:glzjin /flag.txt
chmod 700 /flag.txt

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh
