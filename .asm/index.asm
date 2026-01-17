        .ORIG x3000
        ; index(str, ch)
        ; R1 = str
        ; R2 = ch
        ; R0 = résultat (adresse ou 0)

        AND R0, R0, #0      ; R0 = 0 (par défaut : pas trouvé)

LOOP
        LDR R3, R1, #0      ; R3 = *str
        BRz END             ; si fin de chaîne -> END

        NOT R4, R2          ; R4 = ~ch
        ADD R4, R4, #1      ; R4 = -ch
        ADD R4, R3, R4      ; R4 = *str - ch
        BRz FOUND           ; si égal -> trouvé

        ADD R1, R1, #1      ; str++
        BR LOOP

FOUND
        ADD R0, R1, #0      ; R0 = adresse trouvée

END
        HALT
        .END
