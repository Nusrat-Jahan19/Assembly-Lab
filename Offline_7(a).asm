.MODEL SMALL   
.STACK 100H
.DATA
 
 M1 DB 'ENTER A CHARACTER :','$'
 M2 DB 0AH,0DH,'THE ASCII CODE OF '
 C1 DB ?,' IN BINARY IS :','$'
 M3 DB 0AH,0DH,'THE NUMBER OF 1 BITS IS:'
 C2 DB ?,'$'

.CODE
 MAIN PROC
      
      MOV AX,@DATA     
      MOV DS,AX 
      
      LEA DX,M1        
      MOV AH,9
      INT 21H

      MOV AH,1         
      INT 21H
      MOV BL,AL
      MOV C1,AL       

      LEA DX,M2       
      MOV AH,9 
      INT 21H

      MOV BH,0       
      MOV CX,8
      MOV AH,2

    L1: 
       SHL BL,1       
       JC L2          
       MOV DL,'0'    
       INT 21H
       JMP L3
    
    L2: 
       MOV DL,'1'     
       INT 21H
       INC BH         
    
    L3: 
       LOOP L1
       ADD BH,30H     
       MOV C2,BH
       
       LEA DX,M3
       MOV AH,9       
       INT 21H

       MOV AH,4CH     
       INT 21H
  
  MAIN ENDP
END MAIN