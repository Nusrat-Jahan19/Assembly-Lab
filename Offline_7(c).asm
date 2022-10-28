.MODEL SMALL
.STACK 100H
.DATA
 
 M1 DB 0AH,0DH,'ENTER THE FIRST HEXA NUMBER (0-FFFF):$'
 M2 DB 0AH,0DH,'ENTER THE SECOND HEXA NUMBER (0-FFFF):$'
 M3 DB 0AH,0DH,'THE SUM IN HEXA IS: $'
 M4 DB 0AH,0DH,'ILLEGAL HEXA DIGIT, TRY AGAIN :','$' 
 COUNT DB 4
 VALUE DW ?

.CODE
  MAIN PROC
    
    MOV AX,@DATA   
    MOV DS,AX 
    
    LEA DX,M1     
    MOV AH,9 
    INT 21H

    CALL READ
    MOV VALUE,BX    
    
    LEA DX,M2
    MOV AH,9 
    INT 21H

    CALL READ      
                 
    LEA DX,M3
    MOV AH,9       
    INT 21H
    ADD BX,VALUE   
    JC SHOWCY      
    MOV AH,2      
    MOV DL,'0'
    INT 21H
    JMP NEXT
 
  SHOWCY:
    MOV AH,2
    MOV DL,'1'
    INT 21H
 
   NEXT: 
     CALL SHOW
     MOV AH,4CH   
     INT 21H
  MAIN ENDP       

  READ PROC      
     XOR BX,BX   
     MOV CL,4    
     MOV AH,1
     INT 21H
  
  WHILE: 
     CMP AL,0DH    
     JE END_W      
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
     
  ERR:
    LEA DX,M4       
    MOV AH,9
    INT 21H
    JMP READ      ;
  
  END_W: 
      RET
  READ ENDP

  SHOW PROC           
      MOV CL,4
    
  START: 
    MOV DL,BH
    SHR DL,CL
    CMP DL,9
    JG LETTER1    
    ADD DL,30H    
    JMP SHOW1 
    
  LETTER1:
    ADD DL,37H  
  
  SHOW1: 
    MOV AH,2
    INT 21H
    ROL BX,CL
    DEC COUNT
    CMP COUNT,0
    JNE START
    RET
  SHOW ENDP
END MAIN