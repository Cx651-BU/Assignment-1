    .section .note.GNU-stack
    .intel_syntax noprefix
    .global mystery
    .section .text

    # mystery(int a, int b)
    # a in edi
    # b in esi
    # return value in eax

    mystery:
        push rbp
        mov rbp, rsp

        mov eax, edi        
        add eax, esi        
        imul eax, edi       
        sub eax, esi        

        pop rbp
        ret