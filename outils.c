// INF3135 Construction et maitenance de logiciel C
// Auteur: Jian Chen

// Librairies
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define EXPO 35

// Fonction d'echange les deux nombres
int echange(long long *c, long long *d)
{
	long long temp;
	if(*c > *d)
	{
		temp = *c;
		*c = *d;
		*d = temp;
	}
	return 0;
}

// Fonction de calculer les puissances
long long indice( long long bas, long long puiss) {
    long long resultat = 1;
    for(long long k = 0 ; k < puiss ; k++){resultat *= bas;}
	return resultat;
}
 
// Fonction de trouver les nombre parfaits entre deux intervalles 
int nbParfait(long long debut, long long fin)
{
    bool flag = true;
    long long p = EXPO;
    long long nb;

    if(debut <= 6 && fin >= 6){printf("6\n");}
 
    for(long long i = 3; i <= p; i+=1)
    {
        flag = true;
        long long carre = (indice(2, i)-1);
        for(long long j = 2; j*j < carre; j++)
        {
            if( (carre % j == 0) ){
            flag = false;
            break;
            }
        }
        if(flag)
        {
            nb = indice(2, i-1)*(indice(2,i)-1);
	        if(nb >= debut && nb <= fin){printf("%lld\n", nb);}
	    }
    }
  return 0;
}

