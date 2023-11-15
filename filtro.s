#Para las instrucciones us? esto: https://web.eecs.utk.edu/~smarz1/courses/ece356/notes/assembly/

.data
    IMAG:     .word 1, 2, 3, 4, 5, 6, 7, 8, 9
    SIZE:     .word 3
    ROW_SIZE: .word 12
    OFFSETS:  .word -16, -12, -8, -4, 0, 4, 8, 12, 16

.text
.global main
    
main:
    la s0, IMAG #direccion inicial de la imagen
    #addi s0, s0, 24
    lw s1, SIZE
    lw s2, ROW_SIZE

loop_imag_ini:
    li t0, 0 #contador de loop_imag
    lw t1, SIZE #valor maximo de loop_imag
    mul t1, t1, t1
    
loop_imag_body:
        
    for_vecinos_ini:
        li t2, 0 #contador de for_vecinos
        li t3, 9 #valor maximo de for_vecinos
        la s3, OFFSETS
        
    for_vecinos_body:
        lw s4, 0(s3)       # Load offset from OFFSETS
        add s4, s0, s4     # Calculate vecino = offset + offsets[j]
        
        la t4, IMAG
        blt s4, t4, for_vecinos_sum
        
        la t4, IMAG
        li t5, 4
        mul t5, t5, t1
        add t4, t4, t5
        bge s4, t4, for_vecinos_sum
        
        lw a0, 0(s4)   # Set the syscall argument (assuming integer values)
        li a7, 1       # System call code for print integer
        ecall
    
    for_vecinos_sum:
        addi s3, s3, 4
        addi t2, t2, 1
        blt t2, t3, for_vecinos_body
        j for_vecinos_end

    for_vecinos_end:
        addi s0, s0, 4
        addi t0, t0, 1 
        blt t0, t1, loop_imag_body 
        j loop_imag_end
    
loop_imag_end:
    li a7, 10  # System call code for exit
    ecall
    
    