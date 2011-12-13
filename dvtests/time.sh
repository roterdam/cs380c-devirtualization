#/bin/bash

while read prog
do
echo "Analyzing "$prog
	for ((i = 0; i != $1; i++))
	do
		time ./$prog
	done
done
