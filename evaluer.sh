#!/bin/bash

SILENCE = > /dev/null 2>&1
	
    grep -c -e 'default :' -e 'default:' Makefile > /dev/null 2>&1
	if [ $? == '0' ] 
	then 
		echo 0: reussi 1 pts 
	else
		echo 0: echec	
	fi

	make > /dev/null 2>&1 
	if [ $? == 0 ] 
	then
		echo 1: reussi 1 pts
	else
		echo 1: echec
	fi

	make data > /dev/null 2>&1
	if [ $? == 0 ]
	then
		echo 2: reussi 1 pts
	else
		echo 2: echec
	fi

	ls -1 ./data/data.txt > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 3: reussi 1 pts
	else
		echo 3: echec
	fi

	make test > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 4: reussi 1 pts
	else
		echo 4: echec
	fi

	make clean > /dev/null 2>&1; make clean > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 5: reussi 1 pts
	else
		echo 5: echec
	fi

	grep -c -e 'resultat:' -e 'resultat :' Makefile > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 6: reussi 1 pts
	else
		echo 6: echec
	fi

	ls README.md > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 7: reussi 2 pts
	else 
		echo 7: echec
	fi

	gcc -Wall -pedantic -std=c99 -lm -O1 -o tp2 tp2.c > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 8: reussi 2 pts
	else 
		echo 8: echec
	fi

	./tp2 -c $(cat cp.txt) -i ~/depot/data0.in > /dev/null 2>&1; ls code.txt > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		echo 9: reussi 1 pts
	else
		echo 9: echec
	fi

	./tp2 > /dev/null 2>&1 
	if [ $? == 1 ]
	then
		echo 10: reussi 1 pts
	else
		echo 10: echec
	fi

	./tp2 -c FRAG > /dev/null 2>&1 
	if [ $? == 2 ]
	then
		echo 11: reussi 1 pts
	else
		echo 11: echec
	fi

	./tp2 -c FRAG12345678 -u > /dev/null 2>&1 
	if [ $? == 3 ]
	then
		echo 12: reussi 1 pts
	else
		echo 12: echec
	fi

	./tp2 -c $(cat cp.txt) < ~/depot/data4.err > /dev/null 2>&1 
	if [ $? == 4 ]
	then
		echo 13: reussi 1 pts
	else
		echo 13: echec
	fi

	./tp2 -c $(cat cp.txt) -i ok.txt > /dev/null 2>&1 
	if [ $? == 5 ]
	then
		echo 14: reussi 1 pts
	else
		echo 14: echec
	fi

	./tp2 -c $(cat cp.txt) -o ./ok/ok.txt < ~/depot/data1.in > /dev/null 2>&1 
	if [ $? == 6 ]
	then
		echo 15: reussi 1 pts
	else
		echo 15: echec
	fi



