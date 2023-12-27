	.global _start
	.data
# Global variable
m:
	.byte 65
	.text
_start:

# Set WRITE syscall
	mov $1, %rax
	mov $1, %rdi
	lea m(%rip), %rsi   # Or mov $m, %rsi 
	mov $1, %rdx

alpha:
	syscall
	incb m(%rip)        # Or incb (m)
		
	cmpb $90, m(%rip)   # Or cmpb $90, (m)
	jg end

	jmp alpha

end:
# End program syscall
	mov $60, %rax               
        xor %rdi, %rdi  
	syscall  

