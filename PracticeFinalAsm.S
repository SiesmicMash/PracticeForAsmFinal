.data
    # Data section
.text
    .globl main

int64_t_abs_cmov:
    mov     %rdi, %r9
    imul    $-1, %r9
    mov     %rdi, %rax 
    cmp     $0, %rdi
    cmovle  %r9, %rax

    ret

select_value:
    mov     %rsi, %r8
    mov     %rdx, %r9

    mov     %r8, %rcx
    sub     %r9, %rcx

    mov     %r8, %rax
    add     %r9, %rax
    cmp     %rdi, 0
    cmovge  %rcx, %rax

    ret

sum_even_pos_odd_neg:
    push    %rbx
    mov     %rdi, %rbx  #initial val

    cmp     $1, %rbx    #check if n<= 1, if so return 0
    jle     .finished

    xor     %rcx, %rcx  #counter
    xor     %rdx, %rdx  #sum


.loop:
    cmp     %rcx, %rbx
    je      .finished

    mov     %rcx, %r8 #stores x
    mov     %rcx, %r9 #stores -x
    imul    $-1, %r9  
    

    xor     %r10, %r10 #temp register for cmov
    add     %r8, %r10
    test    $1, %rcx
    cmovnz  %r9, %r10

    add     %r10, %rdx

    inc     %rcx

.finished:
    pop     %rbx
    mov     %rdx, %rax
    ret

