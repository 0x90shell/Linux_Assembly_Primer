.data 

	HelloWorld:
		.asciz "Hello World!\n"

	HelloFunction:
		.asciz "Hello Function!\n"

.text 

	.globl _start

	.type MyFunction, @function

	MyFunction:	# String pointer and len to be added by caller 

			movl $4, %eax
			movl $1, %ebx
			int $0x80
			ret 

	_start :
		nop
		# Print the Hello World String 
		
		leal HelloWorld, %ecx
		movl $13, %edx 
		call MyFunction

		# Print Hello Function 

		leal HelloFunction, %ecx
		movl $16, %edx
		call MyFunction

		# Exit Routine 
		
	ExitCall:
		movl $1, %eax
		movl $0, %ebx 
		int $0x80 



