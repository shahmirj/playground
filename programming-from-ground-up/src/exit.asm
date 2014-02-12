# Simple program to call the exit kernel command taken from the Programming 
# from the ground up book.
#
# This program exits with the value of 15.
#
# To run:
#     make bin/exit
#     bin/exit
#     echo $?

.section .data
.section .text

.globl _start
_start:
    movl $15, %ebx  # Move 15 to ebx, where 15 represents the exit code
    movl $1, %eax   # Move 1 to eax, where 1 represents the command of exit
    int $0x80       # Signal the kernel
