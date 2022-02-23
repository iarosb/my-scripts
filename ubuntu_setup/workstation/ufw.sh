#!/bin/bash

ufw deafult deny incoming
ufw default allow outgoing

ufw allow from 127.17.0.2 to 127.0.0.1 port 3000 proto tcp

ufw enable
echo "----------------------"
echo "--Done--"
ufw status verbose