.text
.global _start
_start:
    mov r0, #0 @ Load the address of IMAG into r0
	mov r1, #100
	mul r1, r1, r1
    mov r2, #100 @ Load the value of SIZE into r1

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