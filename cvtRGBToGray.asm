section .text
global cvtRGBToGray

cvtRGBToGray:
    mov rsi, rdx          ; rsi = rcx (img1 pointer)
    mov rdi, rcx          ; rdi = rdx (img2 pointer)
    xor rax, rax          ; Clear RAX for grayscale calculation
    
    ; Outer loop (rows)
    outer_loop:
        mov rdx, r9       ; RDX = n (inner loop counter)
        
        ; Inner loop (columns)
        inner_loop:
            movzx eax, byte [rsi]        ; EAX = R (img1[i][j][0])
            movzx ebx, byte [rsi + 1]    ; EBX = G (img1[i][j][1])
            add eax, ebx                 ; EAX = R + G
            movzx ebx, byte [rsi + 2]    ; EBX = B (img1[i][j][2])
            add eax, ebx                 ; EAX = R + G + B
            mov bl, 3                    ; BL = 3
            div bl                       ; EAX / BL (grayscale)
            mov [rdi], al                ; Store grayscale value in img2[i][j]
            
            add rsi, 3                   ; Move img1 pointer to next pixel
            inc rdi                      ; Move img2 pointer to next pixel
            
            dec edx                      ; Decrement inner loop counter
            jnz inner_loop               ; Continue inner loop if EDX != 0
        
        dec r8                           ; Decrement outer loop counter
        jnz outer_loop                   ; Continue outer loop if R8 != 0
    
    ; Return to C program
    ret
