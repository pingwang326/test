#!/bin/bash

openssl aes-256-cbc -salt -a -e -in reference/d-90Days -out reference/e-90Days -k wp
openssl aes-256-cbc -salt -a -d -in reference/e-90Days -out reference/d-90Days -k wp

openssl aes-256-cbc -salt -a -e -in reference/d-personal -out reference/e-personal -k wp
openssl aes-256-cbc -salt -a -d -in reference/e-personal -out reference/d-personal -k wp
