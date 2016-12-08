#!/bin/bash


# This script will destroy terraform inf

TERRAFORM_PATH='/repos/aws-home-inf'

function log () {
    echo "[$(date --rfc-3339=seconds)]: $*" 
}

log "Trying to destroy infrastructure"

cd $TERRAFORM_PATH && terraform destroy -force -target=module.compute -var-file=environment/local/terraform.tfvars
