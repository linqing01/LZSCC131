.global start
.intel_syntax noprefix

start:
    # Write "Hello World"       # system call 4 (write code)
    mov rax, 0x2000004
    mov rdi, 1
    lea rsi, hello_world[rip]
    mov rdx, 12                 # Set register rdx to 12
    syscall                     # envoke syscall

    # Exit program
    mov rax, 0x2000001          # system call 1 (exit code)
    mov rdi, 99                 # set the exit code to 99
    syscall

hello_world:                    # Definition of hello_world
    .asciz "Hello World\n"