.MODEL SMALL
.STACK 200H
.DATA
TEXT1 DB 100 DUP ('$')
TEXT2 DB 100 DUP ('$')
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
    LEA SI,TEXT1
    MOV AH,1    
    INPUT:
    INT 21H
    CMP AL,0DH
    JE END_1
    MOV [SI],AL
    INC SI
    INC CX  
    JMP INPUT
    END_1:
    LEA DI,TEXT2
    XOR AX,AX 
    DEC SI
    LOOPER:
    MOV AL,[SI]
    MOV [DI],AL
    DEC SI
    INC DI
    LOOP LOOPER 
    CALL NEWLINE
    MOV AH,9
    LEA DX,TEXT2
    INT 21H    
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