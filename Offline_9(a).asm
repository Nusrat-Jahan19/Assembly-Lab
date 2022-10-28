
.MODEL SMALL
.STACK 100
.DATA
  
  M1 DB 0AH,0DH,'Enter the time in seconds up to 65535 = $ '
  M2 DB 0AH,0DH, 'The time in hh:mm:ss format is = $' 
 

.CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX  
      
     LEA DX,M1
     MOV AH,9 
     INT 21H

     CALL INDEC
     MOV DX,0 
     MOV BX,3600 
     DIV BX
     
     PUSH AX
     PUSH DX

     MOV AH,9 
     LEA DX,M2
     INT 21H
     
     POP DX
     POP AX 
     CALL OUTDEC
     PUSH DX 
     
     MOV AH,2
     MOV DL,':'
     INT 21H 
     
     POP AX
     MOV BX,60
     MOV DX,0
     DIV BX
     CALL OUTDEC 
     PUSH DX

     MOV AH,2
     MOV DL,':'
     INT 21H
     POP AX
     CALL OUTDEC 

     MOV AH,4CH 
     INT 21H
   MAIN ENDP
  INCLUDE D:\ASSEMBLY\TEST_9A\OUTDEC_9(a).ASM
 INCLUDE D:\ASSEMBLY\TEST_9A\INDEC_9(a).ASM
END MAIN