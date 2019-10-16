.model small

display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm

.data
str db "EEELES$"
len equ $-str

.code
mov ax,@data
mov ds,ax
mov es,ax
mov al,'E'
mov di,offset str
mov cx,len
cld

find:scasb
     jne ag
     mov byte ptr es:[di-1],'A'
    ag:loop find
mov dx,offset str
mov ah,09h
int 21h
mov ah,4ch
int 21h

end
