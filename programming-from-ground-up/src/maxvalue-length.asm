; Calculate the max value of the data_items, using length
; as the end of the list
;
; To run:
;     make bin/maxvalue-length
;     bin/maxvalue-length
;     echo $?
;
; The value returned should be 234

.section .data
data_items:
 .long 12,45,3,23,4,5,4,3,234,5,45,43,3,243,123,4,23,4,0
data_items_length:
 .long 8

.section .text

.globl _start
_start:
    movl $0, %edi
    movl data_items(,%edi,4), %eax
    movl %eax, %ebx

loop:
    cmp data_items_length, %edi
    jge endall
    incl %edi
    movl data_items(,%edi,4), %eax
    cmp %ebx, %eax
    jle loop
    movl %eax, %ebx
    jmp loop

endall:
    movl $1, %eax
    int $0x80
