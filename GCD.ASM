.model small
.data
a db 07h
b db 10h
res db 02h dup(?)
.code
start:mov ax,@data
      mov ds,ax
      mov ch,a
      mov bh,b
      mov bl,01h
back:mov al,ch
      xor ah,ah
      div bl
      mov dl,ah
      mov al,bh
      xor ah,ah
      div bl
      add dl,ah
      cmp dl,00h
      je assign
      inc bl
      cmp bl,b
      je final
      jmp back

assign:mov si,offset res
       mov [si],bl
       inc bl
       jmp back
final:mov si,offset res
      mov dl,[si]
      mov al,dl
      add al,00h
      aam
      add ax,3030h
      mov dl,ah
      mov ch,al
      mov ah,02h
      int 21h
      mov dl,ch
      mov ah,02h
      int 21h
     mov ah,4ch
       int 21h

end start
