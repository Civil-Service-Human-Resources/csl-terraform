#!/bin/bash

SUBSCRIPTION_NAME=$1

SUB_ID=$(az account show --subscription "$SUBSCRIPTION_NAME" --query id -o tsv 2>/dev/null)

if [ -z "$SUB_ID" ]; then
  echo "{\"error\": \"Subscription '$SUBSCRIPTION_NAME' not found or not accessible\"}"
  exit 1
fi

val=$(az account show --query id -o tsv)
echo "{\"sub_id\": \"$SUB_ID\"}"