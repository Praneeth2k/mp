.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"Enter string 1..$"
msg2 db 0dh,0ah,"Enter string 2..$"
msg3 db 0dh,0ah,"EQUAL$"
msg4 db 0dh,0ah,"NOT EQUAL$"
msg5 db 0dh,0ah,"The length of sting 1 is $"
msg6 db 0dh,0ah,"The length of sting 2 is $"
str1 db 10h dup(?)
str2 db 10h dup(?)
len1 db 00h
len2 db 00h
.code
mov ax,@data
mov ds,ax
mov si,00h
display msg1
back:mov ah,01h
     int 21h
     cmp al,0dh
     je next
     mov str1[si],al
     inc si
     inc len1
     jmp back
next:mov si,00h
      display msg2
back1:mov ah,01h
     int 21h
     cmp al,0dh
     je next1
     mov str2[si],al
     inc si
     inc len2
     jmp back1

next1:display msg5
      mov al,len1
      aam
      add ax,3030h
      mov ch,al
      mov dl,ah
      mov ah,02h
      int 21h
      mov dl,ch
      mov ah,02h
      int 21h
      display msg6
      mov al,len2
      aam
      add ax,3030h
      mov ch,al
      mov dl,ah
      mov ah,02h
      int 21h
      mov dl,ch
      mov ah,02h
      int 21h
      mov al,len1
      cmp al,len2
      jne noteq
      mov si,00h
      xor cx,cx
      mov cl,len1
back2:mov al,str1[si]
      cmp al,str2[si]
      jne noteq
      inc si
      loop back2
      display msg3
      jmp final
noteq:display msg4
final:mov ah,4ch
      int 21h
end
     
