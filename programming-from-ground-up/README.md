The binaries here represent the exercises or test programs represented in the book.
In some cases binaries have variation, as highlighted in the exercises. Please see
the corresponding `src/*.asm` files to get a detailed description of the variated 
programs.

Variated programs are most commonly prefixed with its parent, for example the max value
with length is called `maxvalue-with-length`

##Installing

Inside this folder run:

    make clean
    make all

## Running

The exit program. Try changing the `%ebx` value to see what happens
    
    bin/exit
    echo $?
