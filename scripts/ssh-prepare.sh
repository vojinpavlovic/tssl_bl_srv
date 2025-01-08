#!/bin/bash
mkdir -p ~/.ssh
echo "${{ secrets.SERVER_SSH_KEY }}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H ${{ secrets.SERVER_IPV4 }} >> ~/.ssh/known_hosts
