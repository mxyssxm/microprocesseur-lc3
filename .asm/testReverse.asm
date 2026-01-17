.ORIG x3000
    AND R1 R1 0
    AND R2 R2 0
    AND R3 R3 0
    AND R4 R4 0
    AND R5 R5 0
    AND R6 R6 0


    LD R1 tst2
    JSR reverse;
    ADD R2 R0 0;

    LD R1 tst3
    JSR reverse;
    ADD R3 R0 0;

    LD R1 tst4
    JSR reverse;
    ADD R4 R0 0;

    LD R1 tst5
    JSR reverse;
    ADD R5 R0 0;

    LD R1 tst6
    JSR reverse;
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

    LD R0 res6;
    NOT R0 R0;
    ADD R0 R0 1;
    ADD R6 R6 R0;

    HALT;

    tst2 .FILL x8000
    tst3 .FILL x0001
    tst4 .FILL xAAAA
    tst5 .FILL xFFFF
    tst6 .FILL x0000

    res2 .FILL x0001
    res3 .FILL x8000
    res4 .FILL x5555
    res5 .FILL xFFFF
    res6 .FILL x0000



reverse : 
        AND R0 R0 0;
        ST R2 x1002;
        AND R2 R2 0;
        ADD R2 R2 15;

    loop :
        ADD R0 R0 R0;
        ADD R1 R1 0;
        BRzp skip;
        ADD R0 R0 1;

    skip : 
        ADD R1 R1 R1;
        ADD R2 R2 -1;
        BRzp loop;

        LD R2 x1002;    
    RET;
    

.END
