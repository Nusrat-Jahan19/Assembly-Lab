.MODEL SMALL
.STACK 100H
.DATA
 M1 DB 0AH,'ENTER A DECIMAL DIGIT STRING :$'
 M2 DB 0AH,'THE SUM OF THE DIGIT IN HEX IS: $'
 M3 DB 0AH,0DH,'ILLEGAL CHARACTER, TRY AGAIN :','$'
 COUNT DB 4
.CODE
    MAIN PROC
      MOV AX,@DATA    
      MOV DS,AX
      LEA DX,M1      
      MOV AH,9 
      INT 21H  
      CALL READ
      LEA DX,M2
      MOV AH,9 
      INT 21H
      CALL SHOW
      MOV AH,4CH 
      INT 21H
 MAIN ENDP


 READ PROC        
    READ_START:
     XOR BX,BX    
    WHILE: 
     MOV AH,1
     INT 21H 
     CMP AL,0DH 
     JE END_W 
     CMP AL,'0' 
     JL ERROR                 
     CMP AL, '9' 
     JG ERROR
     AND AL,0FH      
     CBW               
                       
     ADD BX,AX
     JMP WHILE 
     ERROR:
     LEA DX,M3     
     MOV AH,9 
     INT 21H  
     JMP READ_START
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