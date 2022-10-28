.MODEL SMALL  
.STACK 100H
.DATA
 
 M1 DB 0AH,0DH,'TYPE A HEXA NUMBER (0-FFFF) : ','$'
 M2 DB 0AH,0DH,'IN BINARY IT IS : ','$'
 M3 DB 0AH,0DH,'ILLEGAL HEXA DIGIT, TRY AGAIN :','$'

.CODE
   MAIN PROC
     
    MOV AX,@DATA   
    MOV DS,AX
    
    LEA DX,M1
    MOV AH,9       
    INT 21H

  START:
    XOR BX,BX      
    MOV CL,4       
    MOV AH,1
    INT 21H 
 
  WHILE: 
    CMP AL,0DH     
    JE END_WHILE  
    CMP AL,'0'     
    JL ERR         
    CMP AL, '9'
    JG LETTER      
    AND AL,0FH     
    JMP SHIFT
  
  LETTER:
    CMP AL,'F'     
    JG ERR 
    CMP AL,'A'     
    JL ERR  
    SUB AL,37H

  SHIFT: 
    SHL BX,CL      
    OR BL,AL
    INT 21H
    JMP WHILE      

  END_WHILE:
    LEA DX,M2     
    MOV AH, 9  
    INT 21H
    
    MOV CX,16    
    MOV AH,2
  
  SHOW: 
    SHL BX,1      
    JC ONE        
    MOV DL,'0'
    INT 21H
    JMP DISPLAY
  
  ONE: 
    MOV DL,'1'
    INT 21H
  
  DISPLAY: 
    LOOP SHOW      
    JMP OUT

  ERR:
    LEA DX,M3      
    MOV AH,9
    INT 21H
    JMP START      

  OUT: 
    MOV AH,4CH
    INT 21H
  MAIN ENDP
END MAIN