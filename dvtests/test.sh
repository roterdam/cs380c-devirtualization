#/bin/bash
ls *.out | ./time.sh 5 3>&1 1>&2 2>&3 | python3 average.py
ls *.out.opt | ./time.sh 5 3>&1 1>&2 2>&3 | python3 average.py
