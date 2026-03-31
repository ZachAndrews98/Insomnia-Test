
#!/bin/bash

DEFAULT_NAME="my_design_document"
echo "Name for new design document [Default: $DEFAULT_NAME]"
read filename

filename="${filename:-$DEFAULT_NAME}"

DEFAULT_RULES=".spectral.yaml"
echo "Ruleset to check [Default: $DEFAULT_RULES]"
read ruleset

ruleset="${ruleset:-$DEFAULT_RULES}"

spectral lint ./openapi/$filename/oas.yaml -f json --quiet --ruleset $ruleset