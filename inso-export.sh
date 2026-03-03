#!/bin/bash

DEFAULT_NAME="my_design_document"
echo "Name for new design document [Default: $DEFAULT_NAME]"
read filename

filename="${filename:-$DEFAULT_NAME}"

# inso export spec $filename --output ./openapi/$filename/oas.yaml --verbose <- can't use with git sync
yq -C ".spec.contents" ./openapi/$filename/$filename.yaml -y > ./openapi/$filename/oas.yaml