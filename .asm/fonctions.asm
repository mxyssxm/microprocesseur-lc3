reverse : 
        AND R0 R0 0;    R0 stockera le resultat
        ST R2 x1002;    Sauvegarde des registres qu'on va utiliser
        AND R2 R2 0;
        ADD R2 R2 15;   Compteur de boucle

    loop :
        ADD R0 R0 R0;   On ajoute a lui meme pour decaler les bit de 1
        ADD R1 R1 0;    Inutile pour la condition
        BRzp skip;      On teste le signe de R1 pour savoir si le bit a gauche est 1 ou 0 (si c'est un 0 on saute)
        ADD R0 R0 1;    

    skip : 
        ADD R1 R1 R1;   On decale le resultat de 1 bit
        ADD R2 R2 -1;   Decrementation de la boucle
        BRzp loop;       On recommence tant que le compteur est non nul

        LD R2 x1002;    On charge les registres avec leurs valeur precedentes
    
    RET;
    


ctz :   
        AND R0 R0 0;    initialisation
        ST R2 x1012;    sauvegarde
        AND R2 R2 0;
        ADD R2 R1 -1;   on stocke x-1 dans r2(l entree x est stockee dans r1)
        XOR R0 R1 R2;   premiere etape de la logique
        POPCNT R0 R0;   deuxieme etape
        ADD R0 R0 -1;   derniere etape
        LD R2 x1012;    on remet les valeurs initiales
    RET;


clz :
        ST R1 x1021;    sauvegarde
        JSR reverse;    on utilise la logique clz = ctz(reverse)
        AND R1 R1 0;    
        ADD R1 R1 R0;   on met dans r1(l'entree de ctz) le resultat de reverse(qui est dans r0)
        JSR ctz;        appel de ctz
        LD R1 x1021;    on remet les valeurs initiales
    RET;


