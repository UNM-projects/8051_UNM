;AUTOR: Lucas Gimenez
;FECHA: 4/3/2017
;Universidad Nacional de Moreno   

;*****************************************************************
;***El siguiente código está escrito en lenguaje ensamblador******
;***para la versión actual del microcontrolador 8051**************
;*****************************************************************


            ORG 0
            MOV TMOD, #12H      ;Temporizador 1 en modo 1, temporizador 0 en modo 2
            
            MOV TH0, #-50       ;Valor de recarga en TH0 = -50

            SETB TR0            ;Iniciamos el timer0
LOOP:
            MOV TH1, #0FEH      ;Cargamos el byte superior con -500
            MOV TL1, #0CH       ;Cargamos el byte inferior con -500
            SETB TR1            ;Iniciamos el timer1
WAIT:
            JNB TF0, NEXT       ;Espera por el desborde en el timer0
            

            CLR TF0             ;Limpiamos la bandera de desborde si éste se produjo
            
            CPL P1.0            ;Complementamos el pin 0 del puerto 1
NEXT:
            JNB TF1, WAIT       ;Esperamos por el desborde del temporizador 1


            CLR TR1             ;Apagamos el timer1
            CLR TF1             ;Limpiamos la bandera del timer1

            CPL P2.0            ;Complementamos el pin 0 del puerto 2
            SJMP LOOP           ;Repetimos procedimiento

            END
