#!/bin/bash

if [ ! -f /config/config.json ]; then
	cp /home/nobody/config.json /config/config.json
fi

echo Starting T-rex miner...
echo ============================================================
echo Server: $SERVER
echo Algorithm: $ALGO
echo Wallet: $WALLET
echo Worker: $WORKER
echo Pass: $PASS
echo Fan: $FAN
echo Powerlimit: $POWERLIMIT
echo CCLOCK: $CCLOCK
echo MCLOCK: $MCLOCK
echo ============================================================


./t-rex -c /config/config.json -a $ALGO -o $SERVER -u $WALLET -p $PASS -w $WORKER --fan $FAN --pl $POWERLIMIT --cclock $CCLOCK --mclock $MCLOCK
