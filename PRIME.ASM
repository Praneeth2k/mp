.model small

.code
start:mov ax,@data
      mov ds,ax
      mov dh,00h;counter
      mov ch,02h;actual number
 back:mov bl,02h;divisor
      mov bh,ch
      shr bh,01;dividing ch by 2

back1:cmp bh,bl;checking if bl is more than bh
      jb prime
      mov al,ch
      xor ah,ah
      div bl ;checking if
      cmp ah,00h;remainder is 0
      jz notprime;not prime if remainder is 0
      inc bl
      jmp back1
notprime:inc ch
         jmp back
prime:mov dl,ch
      mov al,dl
      add al,00h
      aam
      add ax,3030h
      mov dl,ah
      mov cl,al
      mov ah,02h
      int 21h
      mov dl,cl
      mov ah,02h
      int 21h
      mov dl,' '
      mov ah,02h
      int 21h

      inc dh
      inc ch
      cmp dh,0AH
      JE FINAL
      jmp back
final:mov ah,4ch
      int 21h
end start
