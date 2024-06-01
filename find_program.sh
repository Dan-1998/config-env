#!/usr/bin/env bash

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

sudo updatedb

locate $1
