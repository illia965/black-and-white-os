[bits 16]
[org 0x7c00]
start:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ah, 0x0e
	
	mov al, 'W'
	int 0x10
	mov al, '_'
	int 0x10
	
	
	
	
keycheck:
	mov ah, 0x00
	int 0x16
	cmp al, "c"
	je itsaclearscrcmd
	
	cmp al, "g"
	je itsarocksimulatorbutwitha
	
	cmp al, "r"
	je justreset
	
	cmp al, "w"
	je itsawinver
	
	cmp al, "h"
	je itsahelp
	
	cmp al, "s"
	je itsasleepmode

	cmp al, "v"
	je ihackyourpc

	cmp al, "a"
	je broyougay
	
	jmp keycheck

itsaclearscrcmd:
	mov ax, 0003h
	int 10h
	jmp keycheck

itsarocksimulatorbutwitha:
	mov ax, 0003h
	int 10h
	mov ah, 0x0e
	mov al, 'A'
	int 0x10
	
	mov al, '_'
	int 0x10
	jmp keycheck
	
itsawinver:
	mov ax, 0003h
	int 10h
	mov ah, 0x0e
	mov al, '1'
	int 0x10
	
	mov al, '.'
	int 0x10
	
	mov al, '0'
	int 0x10
	
	mov al, '_'
	int 0x10
	
	jmp keycheck
	
itsahelp:
	mov ah, 0x0e
	mov al, 'c'
	int 0x10
	
	mov al, 'r'
	int 0x10
	
	mov al, 'g'
	int 0x10
	
	mov al, 'w'
	int 0x10
	
	mov al, '_'
	int 0x10
	
	jmp keycheck
	
justreset:
	jmp 0xFFFF:0000
	
itsasleepmode:
	sti
	hlt
	
	mov ah, 0x01
	int 0x16
	jz itsasleepmode
	
	mov ah, 0x00
	int 0x16
	
	jmp itsaclearscrcmd

ihackyourpc:
	mov ah, 0x0e
	mov al, 'g'
	int 0x10
	mov al, 'g'
	int 0x10

	cli
	hlt

broyougay:
	mov ah, 0x0e
	mov al, 'u'
	int 0x10
	mov al, 's'
	int 0x10
	mov al, 'e'
	int 0x10
	mov al, 'r'
	int 0x10
	mov al, '_'

	jmp keycheck

times 510-($ - $$) db 0
dw 0xAA55
