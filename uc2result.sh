#!/bin/bash -x
declare -A singletResult
echo "Welcome to Flip Coin COmbination Shell program"
read -p "Enter the number of times to flip coin :" numberOfFlips
singletResult[heads]=0
singletResult[tails]=0
for ((counter=1;counter<=numberOfFlips;counter++))
do
	#generating output of heads or tails using RANDOM 1 means heads and 0 means tails
	randomResult=$((RANDOM%2))
	if [ $randomResult -eq 1 ]
	then
		((singletResult[heads]++))
	else
		((singletResult[tails]++))
	fi
done
percentHeads=$((singletResult[heads]*100/numberOfFlips))
percentTails=$((singletResult[tails]*100/numberOfFlips))
