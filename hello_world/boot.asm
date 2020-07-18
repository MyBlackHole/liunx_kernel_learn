org 07c00h ;指定代码加载到7c00地址处  
  
mov ax, cs  
mov ds, ax  
mov es, ax  
call DispStr ;显示字符串  
jmp $ ;无线循环  
  
DispStr:  
mov ax, BootMessage  
mov bp, ax  ;es:bp 串地址  
mov cx, 24  ;字符串长度  
mov ax, 01301h ;AH=13, AL=01h  
mov bx, 000ch  ;BH=0(页号0) BL=0CH(红底黑字高亮)  
mov dl, 0  
int 10h  
ret  
  
BootMessage:   db  "lxhuster hello os world"  
times 510-($-$$) db 0 ;填充剩余空间  
dw 0xaa55 ;固定的结束标志数  