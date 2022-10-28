 ; power function
.MODEL SMALL
.STACK 200H
.DATA
CONSTANT1 EQU '1'
MSG1 DB 0DH,0AH,'Enter a base digit : $'   
MSG2 DB 0DH,0AH,'Enter a power : $'  
MSG3 DB 0DH,0AH,'The answer is  : $'    
NUM DB ?
.CODE                      
PRINTCHAR MACRO D
    MOV AH,2
    MOV DL,D
    INT 21H    
ENDM    
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    MOV AH,1
    INT 21H
    AND AL,0FH
    MOV NUM,AL
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    XOR CX,CX
    MOV AH,1
    INT 21H 
    AND AL,0FH 
    MOV CL,AL    
    DEC CL
    XOR AH,AH    
    MOV AL,NUM
    TOP:
    MUL NUM
    LOOP TOP
    PUSH AX
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    POP AX
    CALL OUTDEC
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
    OUTDEC PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX    
    END_IF1:
    XOR CX,CX
    MOV BX,10D   
    REPEAT1:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX,0    
    JNE REPEAT1
    MOV AH,2     
    PRINT_LOOP:
    POP DX
    OR DL,30H     
    INT 21H
    LOOP PRINT_LOOP   
    POP DX
    POP CX
    POP BX
    POP AX
    RET
    OUTDEC ENDP
END MAIN