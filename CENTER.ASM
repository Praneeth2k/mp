.model small
display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm
.data
msg1 db 0dh,0ah,"Enter a character::$"
val db 02h dup(?)
.code
start:mov ax,@data
      mov ds,ax
      display msg1
      mov si,offset val
      mov ah,01h
      int 21h
      mov [si],al
      mov ah,00h
      mov al,03h
      int 10h
      mov ah,02h
      mov bh,00h
      mov dh,0ch
      mov dl,28h
      int 10h
      mov cx,01h
      mov al,[si]
      mov ah,0Ah
      int 10h
      mov ah,4ch
      int 21h
end start

