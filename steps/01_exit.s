# cc 01_exit.s -nostdlib -static -o 01_exit -g

.global start
.intel_syntax noprefix

start:
    # Exit program
    mov rax, 0x2000001      # 1 号 系统调用
    mov rdi, 70
    syscall