#!/bin/bash

# Public IP address of your ingress controller
IP="13.73.230.220"

# Name to associate with public IP address
DNSNAME="ipa-service"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with DNS name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME