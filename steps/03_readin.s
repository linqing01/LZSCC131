# cc 03_readin.s -nostdlib -static -o 03_readin -g

.global start
.intel_syntax noprefix

start:
    # Read in
    # 3	AUE_NULL	ALL	{ user_ssize_t read(int fd, user_addr_t cbuf, user_size_t nbyte); }
    mov rax, 0x2000003
    mov rdi, 0              # fd: 0 stdin, 1 stdout, 2 stderr
    lea rsi, [rsp+8]        # cbuf
    mov rdx, 5              # nbyte
    syscall

    # Write out "Hi\n"
    # 4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }

    mov rax, 0x2000004
    mov rdi, 1              # fd: 0 stdin, 1 stdout, 2 stderr
    lea rsi, [rsp+8]        # cbuf
    mov rdx, 5              # nbyte
    syscall

    # Exit program
    mov rax, 0x2000001      # 1 号 系统调用
    mov rdi, 88
    syscall

str:
    .asciz "Hi\nab\nbbcc"