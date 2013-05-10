#!/bin/bash

function validate_IP() {
if [ `echo $1 | grep -o '\.' | wc -l` -ne 3 ]; then
        echo "Parameter '$1' does not look like an IP Address (does not contain 3 dots).";
        exit 1;
elif [ `echo $1 | tr '.' ' ' | wc -w` -ne 4 ]; then
        echo "Parameter '$1' does not look like an IP Address (does not contain 4 octets).";
        exit 1;
else
        for OCTET in `echo $1 | tr '.' ' '`; do
                if ! [[ $OCTET =~ ^[0-9]+$ ]]; then
                        echo "Parameter '$1' does not look like in IP Address (octet '$OCTET' is not numeric).";
                        exit 1;
                elif [[ $OCTET -lt 0 || $OCTET -gt 255 ]]; then
                        echo "Parameter '$1' does not look like in IP Address (octet '$OCTET' is not in range 0-255).";
                        exit 1;
                fi
        done
fi
return 0;
}

if [ $# -ne 1 ]; then
        echo "";
        echo "Usage:"
        echo "  `basename $0` IP.ADD.RE.SS";
        echo ""
        exit 1;
else
	validate_IP $1;
fi

NETWORK=`echo $1 | cut -d '.' -f 1-3`

echo "";
echo "Ping check for network $NETWORK.0/24:";
echo "";
echo "--------+-----------------+--------------------------------------------------+----------------";
echo " ACTION | IP              | PTR Record                                       | Status ";
echo "--------+-----------------+--------------------------------------------------+----------------";

for I in `seq 1 254`; do
        echo -n " PING   | ";
        printf "%-15s" "$NETWORK.$I";
        echo -n ' | ';
        HOST=`host $NETWORK.$I`;
        if [ $? -eq 0 ]; then
                PTR=`echo $HOST | awk '{print $5}'`;
                printf "%-48s" $PTR;
        else
                printf "%-48s" "-";
        fi

        ping $NETWORK.$I -c 1 -W 2 > /dev/null;
        if [ $? -eq 0 ]; then
                echo " | Reachable     ";
        else
                echo " | NOT Reachable ";
        fi
done

