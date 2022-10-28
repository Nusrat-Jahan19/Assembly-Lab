 .MODEL SMALL
 .STACK 100H

 .DATA
   M1  DB  'Enter the value of M = $'
   M2  DB  0DH,0AH,'Enter the value of N = $'
   M3  DB  0DH,0AH,'The GCD of M and N is = $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, M1             
     MOV AH, 9
     INT 21H

     CALL INDEC                   

     PUSH AX                     

     LEA DX, M2             
     MOV AH, 9
     INT 21H

     CALL INDEC                   

     PUSH AX 
     POP BX
     POP AX
     L1: MOV DX,0
     DIV BX 
     CMP DX,0
     JE GCD_FOUND 
     MOV AX,BX 
     MOV BX,DX 
     JMP L1
     GCD_FOUND:                   

     LEA DX, M3             
     MOV AH, 9
     INT 21H
     MOV AX, BX                   

     CALL OUTDEC                  

     MOV AH, 4CH                  
     INT 21H
    MAIN ENDP
   INCLUDE D:\ASSEMBLY\TEST_9B\OUTDEC_9(b).ASM
 INCLUDE D:\ASSEMBLY\TEST_9B\INDEC_9(b).ASM
END MAIN

