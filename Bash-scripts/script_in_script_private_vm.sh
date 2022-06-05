#!/bin/bash

ssh -i *.pem ${USER}@${IP} "/home/centos/test-app/remote.sh $1"
