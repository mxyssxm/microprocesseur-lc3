        .ORIG x3000
        ; strcpy
        ; R1 = src
        ; R2 = dst

LOOP
        LDR R3, R1, #0      ; R3 = *src
        STR R3, R2, #0      ; *dst = R3

        BRz FIN             ; si caractère nul, on s'arrête

        ADD R1, R1, #1      ; src++
        ADD R2, R2, #1      ; dst++
        BR LOOP

FIN
        HALT
        .END
