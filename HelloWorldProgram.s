# My first Assembly program

.data

HelloWorldString:
	.ascii "Hello World\n"

.text

.globl _start

_start:
	# Load all the arugments for write ()
	# ssize_t write(int fd, const void *buf, size_t count);
	# Sys call for write() is 4
	# fd = 1 for STDOUT (in EBX)
	# Buf = pointer to memory location containing "Hello World" string (in ECX)
	# Count = string length (in EDX)	
	# int 0x80 

	movl $4, %eax
	movl $1, %ebx
	movl $HelloWorldString, %ecx
	movl $12, %edx
	int $0x80

	# Need to exit th program

	movl $1, %eax
	movl $0, %ebx
	int $0x80



