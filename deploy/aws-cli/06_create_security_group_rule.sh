#!/bin/bash
set -e

IP_ADDRESS=$1

aws --profile exploration --region us-east-2 ec2 authorize-security-group-ingress \
	--group-id $(cat 05_output_create_security_group.json | jq -r '.GroupId') \
	--protocol tcp \
	--port 80 \
	--cidr $IP_ADDRESS/32 | tee 06_output_create_security_group_rule.json
