.ORIG x3000
    AND R1 R1 0
    AND R2 R2 0
    AND R3 R3 0
    AND R4 R4 0
    AND R5 R5 0
    AND R6 R6 0


    LD R1 tst2
    JSR ctz;
    ADD R2 R0 0;

    LD R1 tst3
    JSR ctz;
    ADD R3 R0 0;

    LD R1 tst4
    JSR ctz;
    ADD R4 R0 0;

    LD R1 tst5
    JSR ctz;
    ADD R5 R0 0;

    LD R1 tst6
    JSR ctz;
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

    tst2 .FILL x0001
    tst3 .FILL x0008
    tst4 .FILL x8000
    tst5 .FILL x0F00
    tst6 .FILL x0000

    res2 .FILL x0
    res3 .FILL x0003
    res4 .FILL x000F
    res5 .FILL x0008




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
