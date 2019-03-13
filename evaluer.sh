#!/bin/bash
# evaluer.sh
	
	i=0
    grep -c -e 'default :' -e 'default:' Makefile > /dev/null 2>&1
	if [ $? == '0' ] 
	then
		let i++	
		echo "0: reussi 1 pts"
	else
		echo "0: echec"	
	fi

	make > /dev/null 2>&1
	if [ $? == 0 ] 
	then
		let i++
		echo "1: reussi 1 pts"
	else
		echo "1: echec"
	fi

	make data > /dev/null 2>&1
	if [ $? == 0 ]
	then
		let i++
		echo "2: reussi 1 pts"
	else
		echo "2: echec"
	fi

	ls -1 ./data/data.txt > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "3: reussi 1 pts"
	else
		echo "3: echec"
	fi

	make test > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "4: reussi 1 pts"
	else
		echo "4: echec"
	fi

	make clean > /dev/null 2>&1; make clean > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "5: reussi 1 pts"
	else
		echo "5: echec"
	fi

	grep -c -e 'resultat:' -e 'resultat :' Makefile > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "6: reussi 1 pts"
	else
		echo "6: echec"
	fi

	ls README.md > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "7: reussi 1 pts"
	else 
		echo "7: echec"
	fi

	gcc -Wall -pedantic -std=c99 -lm -O1 -o tp2 tp2.c outils.c > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "8: reussi 1 pts"
	else 
		echo "8: echec"
	fi

	./tp2 -c $(cat cp.txt) -i ~/depot/data0.in > /dev/null 2>&1; ls code.txt > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "9: reussi 1 pts"
	else
		echo "9: echec"
	fi

	./tp2 > /dev/null 2>&1
	if [ $? == 1 ]
	then
		let i++
		echo "10: reussi 1 pts"
	else
		echo "10: echec"
	fi

	./tp2 -c FRAG  
	if [ $? == 2 ]
	then
		let i++
		echo "11: reussi 1 pts"
	else
		echo "11: echec"
	fi

	./tp2 -c FRAG12345678 -u  
	if [ $? == 3 ]
	then
		let i++
		echo "12: reussi 1 pts"
	else
		echo "12: echec"
	fi

	./tp2 -c $(cat cp.txt) < ~/depot/data4.err  
	if [ $? == 4 ]
	then
		let i++
		echo "13: reussi 1 pts"
	else
		echo "13: echec"
	fi

	./tp2 -c $(cat cp.txt) -i ok.txt 
	if [ $? == 5 ]
	then
		let i++
		echo "14: reussi 1 pts"
	else
		echo "14: echec"
	fi

	./tp2 -c $(cat cp.txt) -o ./ok/ok.txt < ~/depot/data1.in  
	if [ $? == 6 ]
	then
		let i++
		echo "15: reussi 1 pts"
	else
		echo "15: echec"
	fi

	./tp2 -c $(cat cp.txt) -i ~/depot/data5.in -o res.out 
	if [ $? == 0 ]
	then
		let i++
		echo "16: reussi 1 pts"
	else
		echo "16: echec"
	fi

	diff --brief -b res.out ~/depot/data5.res 
	if [ $? == 0 ]
	then
		let i++
		echo "17: reussi 1 pts"
	else
		echo "17: echec"
	fi

	./tp2 -c $(cat cp.txt) -o res.out < ~/depot/data1.in 
	if [ $? == 0 ]
	then
		let i++
		echo "18: reussi 1 pts"
	else
		echo "18: echec"
	fi

	diff --brief -b res.out ~/depot/data1.res 
	if [ $? == 0 ]
	then
		let i++
		echo "19: reussi 1 pts"
	else
		echo "19: echec"
	fi

	timeout 90 ./tp2 -c $(cat cp.txt) -i ~/depot/data2.in > res.out
	if [ $? == 0 ]
	then
		let i++
		echo "20: reussi 1 pts"
	else
		echo "20: echec"
	fi

	diff --brief -b res.out ~/depot/data2.res > /dev/null 2>&1 
	if [ $? == 0 ]
	then
		let i++
		echo "21: reussi 1 pts"
	else
		echo "21: echec"
	fi

	timeout 90 ./tp2 -c $(cat cp.txt) < ~/depot/data3.in > res.out
	if [ $? == 0 ]
	then
		let i++
		echo "22: reussi 1 pts"
	else
		echo "22: echec"
	fi

	diff --brief -b res.out ~/depot/data3.res
	if [ $? == 0 ]
	then
		let i++
		echo "23: reussi 1 pts"
	else
		echo "23: echec"
	fi

	echo "Note total pour CHEJ19087301 dans inf3135-h2019-tp2: $i pts"
   	echo "FIN."




