;AUTOR: Lucas Gimenez
;FECHA: 4/03/2017
;Universidad Nacional de Moreno   

;*****************************************************************
;***El siguiente código está escrito en lenguaje ensamblador******
;***para la versión actual del microcontrolador 8051**************
;*****************************************************************

        ORG 0
        LJMP MAIN

INTEX0:
        CLR P1.7           ;Apagamos el horno.
        RETI

        ORG 0013H
INTEX1:
        SETB P1.7          ;Encendemos el horno.
        RETI

        ORG 30H
MAIN:
        MOV IE, #85H       ;Habilitamos las interrupciones externas activadas por borde nagativo.
        SETB IT0
        SETB IT1
        SETB P1.7          ;Encendemos el horno
        JB P3.2, IGNORAR   ;Ignora la siguiente instrucción si el horno está a más de 21°C
        CLR P1.7           ;Apagamos el horno si la temperatura es mayor a 21°C

IGNORA:
        SJMP $             ;Esperamos la interrupción externa
        END
