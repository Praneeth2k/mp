.model small
.data
A db 07,02,05,04,01
n db ($-B)
.code
mov ax,@data
mov ds,ax
mov cl,n
dec cl
outerloop:mov ch,cl
mov SI,0
innerloop:mov al,A[SI]
inc SI
cmp al,A[SI]
jb nox
xchg al,A[SI]
mov A[SI-1],al
nox:dec ch
jnz innerloop
dec cl
jnz outerloop
mov ah,4ch
int 21h
end
