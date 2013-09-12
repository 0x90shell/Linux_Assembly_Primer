.data 
	
	HelloWorld:
		.asciz "Hello World!\n"

	ZeroFlagSet:
		.asciz	"Zero Flag was Set!"

	ZeroFlagNotSet:
		.asciz  "Zero Flag Not Set!"


.text 

	.globl _start

	_start:

		nop	
		movl $10, %eax
		xorl %eax, %eax
		jz PrintHelloWorld

	FlagNotSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagNotSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall



	FlagSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall


	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80 

	PrintHelloWorld:
		movl $10, %ecx
		PrintTenTimes:

			# Save %ecx before it is overwritten
			pushl %ecx
			movl $4, %eax
			movl $1, %ebx

			# %ecx gets overwritten for write() operation
			#leal loads effective address not value
			leal HelloWorld, %ecx
			movl $14, %edx
			int $0x80

			#Operation completes & %ecx is restored
			
			popl %ecx
		#Loop will decrement from %ecx
		loop PrintTenTimes
		jmp ExitCall


