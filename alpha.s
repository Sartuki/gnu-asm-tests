	.global _start
	.text
_start:
# Set stack
	pushq %rbp
	movq %rsp, %rbp

# Character variable 
	movb $65, -1(%rbp)

# Set WRITE syscall
	mov $1, %rax
	mov $1, %rdi
	lea -1(%rbp), %rsi
	mov $1, %rdx

alpha:
	syscall
	incb -1(%rbp)
		
	cmpb $90, -1(%rbp)
	jg end

	jmp alpha

end:
# End program syscall
	mov $60, %rax               
        xor %rdi, %rdi  
	
#Restore RBP
	popq %rbp       
        
	syscall  

