#!/bin/bash

# Checks if the parameter passed is an IP, usign a regular expression.

function re_ip() {
	if [ `echo $1 | egrep '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b'` ]; then
        return 0;
else
        return 1;
fi
}

re_ip $1;

