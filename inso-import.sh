#!/bin/bash

DEFAULT_NAME="my_design_document"
echo "Name for new design document [Default: $DEFAULT_NAME]"
read filename

filename="${filename:-$DEFAULT_NAME}"

# Get a timestamp to use for initial created/updated at time
timestamp=$(date +%s)

# Generate uuids for each section of the design doc
meta=$(uuidgen | sed s/-//g)
jar=$(uuidgen | sed s/-//g)
env=$(uuidgen | sed s/-//g)
spec=$(uuidgen | sed s/-//g)

cp ./doc-template.yaml ./openapi/$filename/$filename.yaml

# Replace simple uuid and timestamp placeholderse
sed -i "s/<timestamp>/$timestamp/g"  ./openapi/$filename/$filename.yaml
sed -i "s/<filename>/$filename/g" ./openapi/$filename/$filename.yaml
sed -i "s/<meta>/$meta/g" ./openapi/$filename/$filename.yaml
sed -i "s/<jar>/$jar/g"  ./openapi/$filename/$filename.yaml
sed -i "s/<env>/$env/g"  ./openapi/$filename/$filename.yaml
sed -i "s/<spec>/$spec/g"  ./openapi/$filename/$filename.yaml

# create temp file for indenting oas spec for copying into design doc
sed 's/^/    /' ./openapi/$filename/oas.yaml > ./openapi/$filename/temp-oas.yaml
sed -i "23r ./openapi/$filename/temp-oas.yaml" ./openapi/$filename/$filename.yaml
sed -i 's/'"'"'/"/g' ./openapi/$filename/$filename.yaml
# sed -i "r /<content>/ ./openapi/$filename/temp-oas.yaml" ./openapi/$filename/$filename.yaml
rm ./openapi/$filename/temp-oas.yaml

