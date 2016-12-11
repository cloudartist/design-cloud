#!/bin/bash


# This script will destroy terraform inf

TERRAFORM_PATH='/repos/aws-home-inf'

function log () {
    echo "[$(date --rfc-3339=seconds)]: $*" 
}

function do_or_die
{
  local command=$1
  echo_info [$command]
  eval $command || exit 1
}

function echo_info
{
  log "INFO: $*"
}

log "Trying to destroy infrastructure"

cd $TERRAFORM_PATH && do_or_die 'terraform destroy -force -target=module.compute -var-file=environment/local/terraform.tfvars'
