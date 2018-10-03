#!/bin/bash

MYSELF=`readlink -f $0`
FQDN=`hostname -f`
DIR=`dirname $0`
FMT="%Y-%m-%d %H:%M:%S"
NOW=$( date +"${FMT}" )
cd $DIR

. ./util.sh

if [ $1 == "out" ];then
  echo $1
  rm reference/e-*
  openssl aes-256-cbc -salt -a -e -in reference/d-90Days -out reference/e-90Days -k $pwd
  openssl aes-256-cbc -salt -a -e -in reference/d-personal -out reference/e-personal -k $pwd
fi

if [ $1 == "in" ]; then
  echo $1
  rm reference/d-*
  openssl aes-256-cbc -salt -a -d -in reference/e-90Days -out reference/d-90Days -k $pwd
  openssl aes-256-cbc -salt -a -d -in reference/e-personal -out reference/d-personal -k $pwd
fi
