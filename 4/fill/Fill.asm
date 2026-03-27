// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

    // col = 0
    @col
    M=0

    // Check if key pressed
(CHECK)
    @n
    M=0
    @KBD
    D=M
    @SETBLACK
    D;JGT
    @SETCLEAR
    D;JEQ

    //if key presssed, col = -1
(SETBLACK)
    @col
    M=-1
    @COLOR
    0;JMP

    // else col = 0
(SETCLEAR)
    @col
    M=0
    
    // set to black or clear every word(pixels) on screen
(COLOR)
     // if n == 8192 goto CHECK
    @n
    D=M
    @8192
    D=D-A
    @CHECK
    D;JEQ

    // address = SCREEN + n
    @SCREEN
    D=A
    @n
    D=D+M
    @addr
    M=D

    // D = col value
    @col
    D=M

    // *addr = col
    @addr
    A=M
    M=D

    // n += 1
    @n
    M=M+1
    @COLOR
    0;JMP

