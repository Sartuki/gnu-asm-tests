	.global _start
	.bss
# Uninitialized value
	.comm text, 5
	.text
_start:
# Set READ syscall
	mov $0, %rax
	mov $0, %rdi
	mov $text, %rsi
	mov $5, %rdx
	syscall 

# Set WRITE syscall
	mov $1, %rax
	mov $1, %rdi
 	mov $text, %rsi
 	mov $5, %rdx
	syscall 

end:
#End program syscall
	mov $60, %rax
	xor %rdi, %rdi
	syscall 

