.ORIG x3000
    AND R1 R1 0
    AND R2 R2 0
    AND R3 R3 0
    AND R4 R4 0
    AND R5 R5 0
    AND R6 R6 0


    LD R1 tst2
    JSR clz;
    ADD R2 R0 0;

    LD R1 tst3
    JSR clz;
    ADD R3 R0 0;

    LD R1 tst4
    JSR clz;
    ADD R4 R0 0;

    LD R1 tst5
    JSR clz;
    ADD R5 R0 0;

    LD R1 tst6
    JSR clz;
    ADD R6 R0 0;


    LD R0 res2;
    NOT R0 R0;
    ADD R0 R0 1;
    ADD R2 R2 R0;

    LD R0 res3;
    NOT R0 R0;
    ADD R0 R0 1;
    ADD R3 R3 R0;

    LD R0 res4;
    NOT R0 R0;
    ADD R0 R0 1;
    ADD R4 R4 R0;

    LD R0 res5;
    NOT R0 R0;
    ADD R0 R0 1;
    ADD R5 R5 R0;

    HALT;

    tst2 .FILL x8000
    tst3 .FILL x4000
    tst4 .FILL x0001
    tst5 .FILL x0008
    tst6 .FILL x0000

    res2 .FILL x0000
    res3 .FILL x0001
    res4 .FILL x000F
    res5 .FILL x000C



    clz :
        ST R1 x1021;    sauvegarde
        JSR reverse;    on utilise la logique clz = ctz(reverse)
        AND R1 R1 0;    
        ADD R1 R1 R0;   on met dans r1(l'entree de ctz) le resultat de reverse(qui est dans r0)
        JSR ctz;        appel de ctz
        LD R1 x1021;    on remet les valeurs initiales
    RET;

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

    
.END
