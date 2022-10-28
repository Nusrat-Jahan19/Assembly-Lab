.MODEL SMALL
.STACK 200H
.DATA
CONSTANT1 EQU '1'
MSG1 DB 0DH,0AH,'THIS $'   
.CODE                      
PRINTCHAR MACRO D
    MOV AH,2
    MOV DL,D
    INT 21H    
ENDM    
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

           
    MOV CH,10
    MOV AH,2
    MOV DL,'*'
    LOOP1:
        MOV DH,10D
        SUB DH,CH
        MOV BL,DH
        LOOP2:
        INT 21H
        DEC CL
        CMP BL,0
        DEC BL        
        JNE LOOP2
    CALL NEWLINE    
    DEC CH
    CMP CH,0
    JNE LOOP1    

        

        
    MOV AH,4CH
    INT 21H    

                                                          
    MAIN ENDP  
    PROC NEWLINE
    PUSH AX
    PUSH DX
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    POP DX
    POP AX
    RET
    NEWLINE ENDP          
END MAIN