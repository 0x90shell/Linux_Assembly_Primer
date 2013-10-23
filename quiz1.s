#Malicious Software and Its Underground Economy

.text 

	.globl _start

	.type gogogo, @function

	gogogo: #magic!
			pop %eax
			ret 

	_start :
			
		push $0xcafebeef 
		call gogogo
		xor %eax,%eax

		# Exit Routine 
		
	ExitCall:
		movl $1, %eax
		movl $0, %ebx 
		int $0x80 

