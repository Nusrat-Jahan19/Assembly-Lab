.MODEL SMALL
.STACK 100H     
.DATA
M1 DB 0AH,0DH,'Enter a string  : ','$'   
M2 DB 0AH,0DH,'Forward string  : ','$'
M3 DB 0AH,0DH,'Backward string : ','$'
M4 DB 0AH,0DH,'The string is palindrome$'
M5 DB 0AH,0DH,'The string is not palindrome$'

T1 DB 100 DUP('$')
T2 DB 100 DUP('$')

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    MOV ES,AX
        
    CLD     
    
    MOV AH,9 
    LEA DX,M1
    INT 21H    
             
    XOR CX,CX 
    
    MOV AH,1
    
    
    LEA SI,T1
    
    WHILE_: 
    INT 21H
    CMP AL,0DH
    JE END_WHILE
    
    CMP AL,33D
    JE WHILE_:
    
    CMP AL,34D
    JE WHILE_:
    
    CMP AL,39D
    JE WHILE_:
    
    CMP AL,' '
    JE WHILE_:
    
    CMP AL,44D
    JE WHILE_:
              
              
    CMP AL,45D
    JE WHILE_:
    
    CMP AL,46D
    JE WHILE_:
    
    CMP AL,58D
    JE WHILE_:
    
    
    CMP AL,59D
    JE WHILE_:
    
    
    CMP AL,95D
    JE WHILE_:
    
    CMP AL,96D
    JE WHILE_:                          
    
    PUSH AX
    INC CX
    MOV [SI], AL
    INC SI  
       
    JMP WHILE_
    
    END_WHILE:

    JCXZ EXIT  
    
    LEA DI,T2
    MOV BX,CX        
    
    MOV AH,2
    TOP:
    POP DX    
    MOV [DI],DL
    INC DI
    INT 21H
    LOOP TOP

    MOV AH,9
    LEA DX,M2
    INT 21H   
    
    MOV AH,9
    LEA DX,T1
    INT 21H           
    
    MOV AH,9
    LEA DX,M3
    INT 21H       
    
    MOV AH,9
    LEA DX,T2
    INT 21H           
    
    CALL NEWLINE
            
    LEA SI,T1
    LEA DI,T2
    
    MOV CX,BX
    REPE CMPSW    
    
    JZ CHECK_PALINDROME        
    
    MOV AH,9
    LEA DX,M5
    INT 21H  
        
    JMP EXIT
    CHECK_PALINDROME:
    
    MOV AH,9
    LEA DX,M4
    INT 21H  
    
    EXIT:
    
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
