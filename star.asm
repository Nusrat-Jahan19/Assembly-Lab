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
    MOV CX,6
    LOOPER:       
    MOV AH,1
    INT 21H    
    LOOP LOOPER
    MOV CX,5
    MOV DL,'*'  
    LOOPER2:
    MOV AH,2   
    INT 21H
    LOOP LOOPER2

        
    MOV AX,4C00H
    INT 21H                                                        
    MAIN ENDP  
END MAIN