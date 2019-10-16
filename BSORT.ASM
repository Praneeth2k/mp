.model small
.data
n dw 5
A dw 03,01,04,02,07
.code
mov ax,@data
mov ds,ax
mov dx,n
dec dx

outerloop:mov cx,dx
          mov si,00h
innerloop:mov ax,A[si]
          inc si
          inc si
          cmp ax,A[si]
          jb noxchg
          xchg ax,A[si]
          mov A[si-2],ax
noxchg:dec cx
       jnz innerloop
       dec dx
       jnz outerloop
       mov ah,4ch
       int 21h
       end
