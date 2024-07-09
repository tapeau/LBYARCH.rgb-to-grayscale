section .text
global cvtRGBToGray

cvtRGBToGray:
    mov r10, r8     ; Load m into R10 for outer loop (rows)

; Outer loop (rows)
outer_loop:
    mov r11, r9     ; Load n into R11 for inner loop (columns)

; Inner loop (columns)
; TODO: Fix whatever the fuck is wrong with it
inner_loop:
    movzx rax, byte [rdx]     ; Move R from img1[i][j][0] into RAX
    movzx rbx, byte [rdx+1]   ; Move G from img1[i][j][1] into RBX
    add rbx, rax              ; RAX = RAX + RBX (R + G)
    movzx rbx, byte [rdx+2]   ; Move B from img1[i][j][2] into RBX
    add rax, rbx              ; RAX = R + G + B
    mov rbx, 0x3              ; RBX = 3
    div rbx                   ; RAX / RBX (grayscale)
    mov [rcx], rax            ; Store grayscale value in img2[i][j]

    add rdx, 0x3              ; Move img1 pointer to next pixel
    add rcx, 0x1              ; Move img2 pointer to next pixel

    dec r11                   ; Decrement inner loop counter
    jnz inner_loop            ; Jump to inner_loop if R11 != 0

    dec r10                   ; Decrement outer loop counter
    jnz outer_loop            ; Jump to outer_loop if R10 != 0

    ; Return to C program
    ret