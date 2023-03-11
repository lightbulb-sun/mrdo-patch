incbin "mrdo.col"


CURRENT_PHASE: equ $7274

TREAT_1_INDEX: equ 0
TREAT_2_INDEX: equ 1
TREAT_3_INDEX: equ 2
TREAT_4_INDEX: equ 3

TREAT_1: equ 0xa
TREAT_2: equ 0xb
TREAT_3: equ 0xc
TREAT_4: equ 0xd

MAX_PHASE: equ 22
MAX_SCORE: equ 8000


myorg: macro addr
        seek    addr-$8000
        org     addr
endm


; fix alphamonster
myorg $a63b
        sub     $f4                     ; have alphamonster spawn...
myorg $a63f
        sbc     a, $01                  ; ... after every 5000 points


; fix cherry scoring
myorg $96be
        ld      de, 45                  ; reduce 8th cherry bonus from 500 to 450


; fix treats
myorg $82f5
        cp      MAX_PHASE-1             ; If phase above 21, ...
myorg $82f9
        ld      a, TREAT_4_INDEX        ; ... always use treat 4.
        ld      hl, treat_table         ; Otherwise consult own table.


; fix treat score
myorg $970e
        call    fix_treat_score
myorg $d430
fix_treat_score:
        ld      a, (CURRENT_PHASE)
        cp      MAX_PHASE
        jr      c, .cont                ; If phase above 21, ...
        ld      a, MAX_SCORE/500-1      ; top out at 8000 points.
        ret
.cont:
        dec     a
        ld      d, 0
        ld      e, a                    ; Otherwise load score...
        ld      hl, treat_score_table   ; from own table.
        add     hl, de

        ld      a, (hl)
        dec     a
        ret


; SCORE GUIDE FOR TREATS:

; Treat #1: 1,000 points
; Treat #2: 1,500 points
; Treat #3: 2,000 points
; Treat #4: 2,500 points

; Treat #5: 3,000 points (scenes 5-6)
; Treat #6: 3,500 points (scenes 7-8)
; Treat #7: 4,000 points (scenes 9-10)
; Treat #8: 4,500 points (scenes 11-12)

; Treat #9: 5,000 points (scenes 13-15)
; Treat #10: 6,000 points (scenes 16-18)
; Treat #11: 7,000 points (scenes 19-21)

; Treat #12: 8,000 points (scene 22+)
treat_score_table:
        db      1000/500
        db      1500/500
        db      2000/500
        db      2500/500

        db      3000/500
        db      3000/500

        db      3500/500
        db      3500/500

        db      4000/500
        db      4000/500

        db      4500/500
        db      4500/500

        db      5000/500
        db      5000/500
        db      5000/500

        db      6000/500
        db      6000/500
        db      6000/500

        db      7000/500
        db      7000/500
        db      7000/500


; TREAT GUIDE

; Treat #1: scenes 1, 5-6 and 13-15
; Treat #2: scenes 2, 7-8 and 16-18
; Treat #3: scenes 3, 9-10 and 19-21
; Treat #4: scenes 4, 11-12 and 22+
treat_table:
        db      TREAT_1
        db      TREAT_2
        db      TREAT_3
        db      TREAT_4
        db      TREAT_1, TREAT_1
        db      TREAT_2, TREAT_2
        db      TREAT_3, TREAT_3
        db      TREAT_4, TREAT_4
        db      TREAT_1, TREAT_1, TREAT_1
        db      TREAT_2, TREAT_2, TREAT_2
        db      TREAT_3, TREAT_3, TREAT_3
