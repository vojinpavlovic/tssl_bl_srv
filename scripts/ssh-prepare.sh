#!/bin/bash
mkdir -p ~/.ssh
echo "$SERVER_SSH_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H $SERVER_IPV4 >> ~/.ssh/known_hosts
