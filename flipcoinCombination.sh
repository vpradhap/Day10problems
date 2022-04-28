#!/bin/bash

coin_toss=$((RANDOM%2))

if [ $coin_toss -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi

