; Simple program to use power functions, it is calculating
;
; (4^2) + (3^2)
;
; This program exits with the value of 25.
;
; To run:
;     make bin/power
;     bin/exit
;     echo $?

.section .data

.section .text
.globl _start

_start:
    push $4	    ; parameter 1 for pow
    push $2	    ; parameter 2 for pow
    call pow
    add $16, %rsp    ; Move the stack pointer back

    push %rax	    ; push our last answer to the stack, beacuse
		    ; rax will get overwritten the second time around

    push $3	    ; parameter 1 for pow
    push $2	    ; parameter 2 for pow
    call pow
    add $16, %rsp    ; Move the stack pointer back
    
    pop %rbx	    ; Remove the old stored value to rbx
    add %rax, %rbx  ; Add old pow value to the new pow value

    mov $1, %rax    ; Set the system call to exit, note rbx stores
		    ; the exit return value
    int $0x80	    ; Interupt the operating system

.type pow, @function
pow:
    push %rbp	    ; Store the previous base pointer
    mov %rsp, %rbp  ; Set the current basepointer to the stack pointer

    mov 24(%rbp), %rax	; Load param1 into rax
    mov 16(%rbp), %rbx  ; Load param2 into rbx

    sub $8, %rsp    ; Local value which stores the result
    mov %rax, -8(%rbp) ; Store our local value with the base

pow_loop:
    cmp $1, %rbx    ; Compare the current power
    je pow_end	    ; If equal to one go to the end variable

    imul -8(%rbp), %rax ; Multiply what is in -8(rbp) by rax and store the result

    dec %rbx	; Decrease the power count
    jmp pow_loop    ; And jump back to the start

pow_end:
    mov %rbp, %rsp  ; Restore the stack pointer
    pop %rbp	    ; Restore the original base pointer
    ret		    ; Return back to the world
