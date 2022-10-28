.model small
.stack 100h
.data
  n dw 2
  m dw 'result:$'

  
.code 
   main proc
    mov ax,@data
    mov ds,ax
    mov ax,n
    mov bx,ax
    shl bx,1
    shl bx,1
    
    lea dx,m
    mov ah,9
    int 21h
    
    mov ah,2
    mov dx,bx
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
   end main