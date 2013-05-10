#!/bin/bash

# Checks if the parameter passed is an IP Address and outputs 0/1.

function is_IP() {
if [ `echo $1 | tr '.' ' ' | wc -w` -ne 4 ]; then
        return 1;
else
        for OCTET in `echo $1 | tr '.' ' '`; do
                if ! [[ $OCTET =~ ^[0-9]+$ ]] || [[ $OCTET -lt 0 ]] || [[ $OCTET -gt 255 ]]; then
                        exit 1;
                fi
        done
fi

return 0;
}

is_IP $1;
