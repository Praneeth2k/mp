.model small
.data
n dw 010h
r dw 04h
res dw 00h
.code
mov ax,@data
mov ds,ax
mov ax,n
mov bx,r
call ncr
xor ax,ax
mov ax,res
add ax,0000h
aam
add ax,3030h
mov ch,al
mov dl,ah
mov ah,02h
int 21h
mov dl,ch
mov ah,02h
int 21h
mov ah,4ch
int 21h

ncr proc near
  cmp ax,bx
  je res1
  cmp bx,0
  je res1
  cmp bx,1
  je resn
  dec ax
  cmp bx,ax
  je incr
  push ax
  push bx
  call ncr
  pop bx
  pop ax
  dec bx
  push ax
  push bx
  call ncr
  pop bx
  pop ax
  ret

  res1:inc res
       ret

  incr:inc res
  resn:add res,ax
       ret
   ncr endp
   end
