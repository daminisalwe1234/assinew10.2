#!/bin/bash -x

echo "Welcome to Flip Coin COmbination Shell program"

#generating output of heads or tails using RANDOM 1 means heads and 0 means tails

singletResult=$((RANDOM%2))
if [ $singletResult -eq 1 ]
then
	echo "It is a Heads"
else
	echo "It is a Tails"
fi
