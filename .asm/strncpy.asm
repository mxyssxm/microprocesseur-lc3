        .ORIG x3000
        ; R1 = src (adresse chaîne source)
        ; R2 = dst (adresse chaîne destination)

LOOP    LDR R3, R1, #0      ; R3 = mem[R1]
        STR R3, R2, #0      ; mem[R2] = R3
        BRz DONE            ; si R3 == 0 (fin de chaîne), stop
        ADD R1, R1, #1      ; src++
        ADD R2, R2, #1      ; dst++
        BR  LOOP            ; recommencer

DONE    TRAP x25            ; HALT
        .END
