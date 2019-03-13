// INF3135 Construction et maitenance de logiciel C
// Auteur: Jian Chen

// Librairies
#include <stdio.h>

// Fonction de trouver les nombres parfaits
int nombreParfait(long long a, long long b)
{
	long long i, j, sum;
	for(i=a; i<=b; ++i)
	{
		sum=1;
		if(i%10 == 6 || i%100 == 28)
		{
			for(j=2; j*j<=i; ++j)
				if(i%j == 0)
				{
					sum += j;
					if(j*j != i)
					{
						sum += i/j;
					}
				}
		}
		if(sum == i && i !=0 && i !=1)
		{
			printf("%lld\n", i);
		}

	}
	return 0;

}

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
