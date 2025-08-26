#  ______     __   
# /\  == \   /\ \  
# \ \  __<   \ \ \ 
#  \ \_____\  \ \_\
#   \/_____/   \/_/
#
# Aug 22 2025
# melancolia20i
# listening to: otra aporia - noiseferatu

.section .rodata
	.usage_msg: .string "bi: usage: bi [CODE]\n"
	.usage_len: .quad   24

.section .text

.globl _start

_start:
	popq	%rax
	cmpq	$2, %rax
	jne	.usage
	popq	%rax
	popq	%r8
.lexer_loop:
	movzbl	(%r8), %edi
	cmpb	$0, %dil
	je	.continue
	call	.IsItToken	
	
.lexer_inc:
	incq	%r8
	jmp	.lexer_loop

.continue:

.usage:
	movq	$1, %rax
	movq	$1, %rdi
	leaq	.usage_msg(%rip), %rsi
	movq	.usage_len(%rip), %rdx
	syscall
.exit:
	movq	$60, %rax
	movq	$0, %rdi
	syscall

.IsItToken:
	movq	$1, %rax
	cmpb	$'.', %dil
	je	.isitok_ret
	cmpb	$',', %dil
	je	.isitok_ret
	cmpb	$'+', %dil
	je	.isitok_ret
	cmpb	$'-', %dil
	je	.isitok_ret
	cmpb	$'<', %dil
	je	.isitok_ret
	cmpb	$'>', %dil
	je	.isitok_ret
	cmpb	$'[', %dil
	je	.isitok_ret
	cmpb	$']', %dil
	je	.isitok_ret
	movq	$0, %rax
.isitok_ret:
	ret
