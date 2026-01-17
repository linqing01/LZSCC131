# cc 04_writethree.s -nostdlib -static -o 04_writethree -g

.global start
.intel_syntax noprefix

start:
    # Write out "Hi\n"
    # 4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }

    mov rbx, 3

  repeat:  
    mov rax, 0x2000004
    mov rdi, 1              # fd: 0 stdin, 1 stdout, 2 stderr
    lea rsi, str[rip]       # cbuf
    mov rdx, 6              # nbyte
    syscall
    dec rbx
    jnz repeat


    # Exit program
    mov rax, 0x2000001      # 1 号 系统调用
    mov rdi, 88
    syscall

str:
    .asciz "Hi\nab\nbbcc"