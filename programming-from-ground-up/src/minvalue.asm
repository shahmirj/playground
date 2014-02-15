; Calculate the min value of the data_items
;
; To run:
;     make bin/minvalue
;     bin/minvalue
;     echo $?
;
; The value returned should be 2

.section .data
data_items:
 .long 12,45,2,3,23,4,5,4,3,234,5,45,43,3,243,123,4,23,4,0

.section .text

.globl _start
_start:
    movl $0, %edi
    movl data_items(,%edi,4), %ebx

loop:
    movl data_items(,%edi,4), %eax
    cmp $0, %eax
    je endall
    incl %edi
    cmp %ebx, %eax
    jg loop
    movl %eax, %ebx
    jmp loop

endall:
    movl $1, %eax
    int $0x80
