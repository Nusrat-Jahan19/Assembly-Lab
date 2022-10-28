  .MODEL SMALL
.STACK 100H 

.DATA

  VAR DW -2241

.CODE

MAIN PROC
    
    MOV AX , @DATA
    MOV DS , AX
      
    MOV BX , VAR  
    SAR BX , 1
    SAR BX , 1
    
    MOV AX,BX
  
    
  MAIN ENDP 

END MAIN