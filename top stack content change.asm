.MODEL SMALL
.STACK 200H
.DATA
MSG1 DB 0DH,0AH,'Enter a string : $'   
MSG2 DB 0DH,0AH,'THE EXCHANGED CONTENT IS: $'
TEMP DW ?   
.CODE                      
PRINTCHAR MACRO D
    MOV AH,2
    MOV DL,D
    INT 21H    
ENDM    
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    XOR CX,CX
    XOR DX,DX
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE NEXT
    PUSH AX
    INC CX
    JMP INPUT
    NEXT:
    POP BX
    POP DX
    MOV TEMP,BX
    MOV BX,DX
    MOV DX,TEMP
    PUSH DX
    PUSH BX
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    XOR DX,DX
    MOV AH,2
    OUTPUT:
    POP DX
    INT 21H        
    LOOP OUTPUT

    MOV AX,4C00H
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