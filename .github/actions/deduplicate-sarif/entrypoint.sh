#!/bin/sh -l

# Input SARIF file path
INPUT_SARIF_FILE="$1"

# Deduplicate SARIF file using jq
jq -s 'map({results} | unique | {results})' "$INPUT_SARIF_FILE" > deduplicated-sarif.sarif

# Rename the deduplicated SARIF file
mv deduplicated-sarif.sarif "$INPUT_SARIF_FILE"
