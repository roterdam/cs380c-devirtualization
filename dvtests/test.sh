#/bin/bash

for prog in ./declared.out ./pairwise.out ./declared_devirt.out ./pairwise_devirt.out
do
echo "Analyzing "$prog
	for i in 1 2 3 4 5
	do
		time $prog
	done
done
