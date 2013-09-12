.data

	HelloWorld:
		.asciz "Hello World!\n"

.text 

	.globl _start
	.type PrintFunction, @function

	PrintFunction:
		
		pushl %ebp  # store the current value of EBP on the stack 
		movl %esp, %ebp # Make EBP point to top of stack 
		
		# The write function 

		movl $4, %eax
		movl $1, %ebx
		movl 8(%ebp), %ecx
		movl 12(%ebp), %edx
		int $0x80

		movl %ebp, %esp # Restore the old value of ESP
		popl %ebp # Restore the old value of EBP 
		ret  # change EIP to start the next instruction 

	_start:

		nop
		
		# push the strlen on the stack 
		pushl $13

		# push the string pointer on the stack

		pushl $HelloWorld

		# Call the function 
		call PrintFunction

		# adjust the stack pointer 

		addl $8, %esp 


		# Exit Routine 

		ExitCall:

			movl $1, %eax
			int $0x80



