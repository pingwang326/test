#!/bin/bash

MYSELF=`readlink -f $0`
FQDN=`hostname -f`
DIR=`dirname $0`
FMT="%Y-%m-%d %H:%M:%S"
NOW=$( date +"${FMT}" )

cd
pwd=$(cat key/.test)

cd $DIR
openssl aes-256-cbc -salt -a -e -in reference/d-90Days -out reference/e-90Days -k $pwd
openssl aes-256-cbc -salt -a -d -in reference/e-90Days -out reference/d-90Days -k $pwd

openssl aes-256-cbc -salt -a -e -in reference/d-personal -out reference/e-personal -k $pwd
openssl aes-256-cbc -salt -a -d -in reference/e-personal -out reference/d-personal -k $pwd
