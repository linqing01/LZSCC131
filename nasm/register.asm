;; nasm -fmacho64 register.asm
;; cc register.o -nostdlib -static
;; ./a.out

%use altreg

        global  start

        section .text
start:  
        mov     r0d, 0x02000004         ; system call for write
        mov     r7, 1                  ; file handle 1 is stdout
        mov     r6, message            ; address of string to output
        mov     r2, 16                 ; number of bytes
	syscall                         ; invoke operating system to do the write
	mov     r0, 0x02000001         ; system call for exit
	xor     r7, r7                ; exit code 0
	syscall                         ; invoke operating system to exit

	section .data
message:
	db     "Hello, Register", 10      ; note the newline at the end

;;; byte(B:8bit) -> wide(W:16bit) -> double wide(D:32bit) -> R:64bit
;;; R0(aka RAX):64bit -> R0D(aka EAX):32bit -> R0W(aka AX):16bit -> R0B(aka AL):8bit, AH