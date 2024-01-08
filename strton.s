	.global _start
	.data
s:
	.string "981567"
	.text
_start:
	lea s(%rip), %rsi
	call strton
end:
#End program syscall
	mov $60, %rax
	xor %rdi, %rdi
	syscall
strlen:
# Calculate string lenght
	xor %rax, %rax
_loopstrlen:
	cmp $0, (%rsi)
	je _endstrlen
	inc %rax
	inc %rsi
	jmp _loopstrlen
_endstrlen:
	sub %rax, %rsi 
	ret
strton:
# Create number out of a string
	call strlen
	mov %rax, %rbx
	xor %rax, %rax
	add %rbx, %rsi
	dec %rsi
	mov $1, %rcx
_loopstrton:
	cmp $0, %rbx
	je _endstrton
	mov (%rsi), %dl
	sub $48, %rdx
	imul %rcx, %rdx
	add %rdx, %rax
	xor %rdx, %rdx # at some point imul %rcx, %rdx will overflow
                       # %dl and use the resting part of %rdx. When
                       # we mov (%rsi), %dl, that rest will append to
                       # %dl and change the intended content.
	imul $10, %rcx
	dec %rbx
	dec %rsi
	jmp _loopstrton
_endstrton:
	ret	


