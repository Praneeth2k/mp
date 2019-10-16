.model small
.data
n dw 06h
res db 02h dup(?)
.code
mov ax,@data
mov ds,ax
mov dx,n
back:push dx
     dec dx
     jnz back

mov ax,01h

back1:pop dx
      push dx
      mul dx
      pop dx
      cmp dx,n
      jnz back1
      mov si,offset res
      mov [si],ah
      mov[si+1],al
      mov ah,4ch
      int 21h
end
