// INF-3135 Construction et maintenance de logiciel en C
// Auteur: Jian Chen

// Librairies
#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

// Fonctions main
int main(int argc, char** argv) {

    // Déclaration des variables
    FILE *entree = NULL;
    FILE *sortie = NULL;
    FILE *code = NULL; 
    int i=0, j=0, min, sum, max, count, tete=0, tail=0;
    count = argc;

    // Validations des arguments
    for(int i = 0; i < count; i++){
        entree = stdin;
        sortie = stdout;

        if(entree == NULL){
            return 5;
        }else if(sortie == NULL){
            return 6;
        }

        if(count < 2 || count == 4 || count == 6 || strcmp(argv[1], "-c") != 0){
            fprintf(stderr, "La ligne de commande doit être sous la forme suivante: %s <-c CODEpermanent> [-i fichier.in] [-o fichier.out] \n", argv[0]);
            return 1;
        }

        if(strcmp(argv[1], "-c") == 0 && (count == 2 || strlen(argv[2]) != 12)){
            return 2;
        }

        if(count == 5){ 
            if(strcmp(argv[3], "-i") != 0 && strcmp(argv[3], "-o") != 0){
                return 3;
            }else if(strcmp(argv[3], "-i") == 0 ){
                entree = freopen(argv[4], "r", stdin);
                if(entree == NULL)
                    return  5;
            }else if(strcmp(argv[3], "-o") == 0){
                sortie = freopen(argv[4], "w", stdout);
                if(sortie == NULL)
                    return 6;
            }
         }

	if(count == 7){
            if((strcmp(argv[3], "-i") != 0 && strcmp(argv[3], "-o") != 0) || (strcmp(argv[5], "-i") != 0 && strcmp(argv[5], "-o") != 0)){
	        return 3;
	    }else if(strcmp(argv[3], "-i") == 0 && strcmp(argv[5], "-o") == 0){
                entree = freopen(argv[4], "r", stdin);
                sortie = freopen(argv[6], "w", stdout);
                if(entree == NULL){
                    return 5;
                }else if(sortie == NULL){
                    return 6;
                }
             }else if(strcmp(argv[3], "-o") == 0 && strcmp(argv[5], "-i") == 0){
                sortie = freopen(argv[4], "w", stdout);
                entree = freopen(argv[6], "r", stdin);
                if(entree == NULL){
                    return 5;
                }else if(sortie == NULL){
                    return 6;
                }
            }
	}
    }

    // Créer un fichier code.txt qui contient le code permanent qui est passé par l'argument -c
    code = fopen("code.txt", "w");
    fprintf(code, "%s\n", argv[2]);
    fclose(code);

    // Validation des intervalles dans le fichier entrée 
    int a = scanf("%d", &tete);
    int b = scanf("%d", &tail);
    if(a != 1 || b != 1 || tete < 0 || tail < 0 ){
       return 4;
    }

    // Déterminer le nombre minimal et maximal
    if(tete > tail){
        max = tete;
        min = tail;
    }else{
        max = tail;
        min = tete;
    }
    fclose(entree);

    // Calculer les nombres parfaits entre les intervalles
    for(i=min; i<=max; i++){
        sum=0;
        for(j=1; j<i; j++){
            if(i%j==0)
                sum += j;
        }
        if(sum == i && i != 0){

            printf("%d\n", i);
        }
    }
    return 0;
} 

