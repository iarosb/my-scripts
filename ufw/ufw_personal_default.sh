#!/bin/bash

ufw deafult deny incoming
ufw default allow outgoing

ufw enable
echo "----------------------"
echo "--Done--"
ufw status verbose