#!/bin/bash
mkdir -p ~/.ssh
echo "$1" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H $2 >> ~/.ssh/known_hosts
