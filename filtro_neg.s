.data
IMAG:  .word 255, 250, 150, 100, 80, 39, 20, 10, 1
FILT:  .space 36

.text
.global _start
_start:
    ldr r0, =IMAG @ Load the address of IMAG into r0
	ldr r1, =FILT
    mov r2, #3 @ Load the value of SIZE into r1

loop_imag_ini:
    mov r3, #0  @ contador de loop_imag (loop counter)
    mul r4, r2, r2 @valor máximo de loop_imag (SIZE * SIZE)

loop_imag_body:
	ldr r5, [r0]  @ Carga valor actual de matriz, aumenta la direccion
	add r0, #4
	mov r6, #255
	sub r5, r6, r5   @ pixel = 255 - pixel

	str r5, [r1]
	add r1, #4
	
	add r3, r3, #1
	cmp r3, r4
	blt loop_imag_body