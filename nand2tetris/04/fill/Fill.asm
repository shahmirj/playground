// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


// Set up our R0 register to point to the first screen pixel
(INIT)

    // Reset our R0 to point to screen so we can create a counter
    // To go UP by one
    @SCREEN
    D=A
    @R0
    M=D // Start our counter at the screen[0] position

// Go through each screen position stored at @R0 and set the value
// to the color represented by key-down or key-up. Note key-down should
// draw -1 and key-up should draw 0 
//
// In the end increment the screen pointer up one to go to the next
// Screen value 
(LOOP)

// Read the value from our input and store it in R2
(INPUT)
    @KBD
    D=M
    @R2
    M=D

    // Jump to white if the input is <= 0
    @WHITE
    D;JLE

// This bit will change the code to black
(BLACK)
    // Set to black, -1 is all 1111111.. in the address
    D=-1

    // Use this if you want D to have the value of input
    //@R2 
    //D=M

    @LOGIC
    0;JMP

// This bit will change the code to white
(WHITE)
    D=0

(LOGIC)

    // Load the R0 address, set our address to the value of R0
    // And then set the A register to have the value of D
    @R0
    A=M
    M=D

    // add one to R0 so we can draw on the next part of the screen
    @R0
    M=M+1

    // Keep going
    @LOOP
    0;JMP

// Bye Bye!
(END)
    @END
    0;JMP