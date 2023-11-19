.global _start

.section .data
numbers:    .word 5, 2, 8, 1, 6   @ lista de nums a ordenar
length:     .word 5                 @ largo de la lista

.section .text
_start:
    ldr r0, =numbers       @ dir del inicio de la lista
    ldr r1, =length        @ dir de la longitud de la lista

    mov r2, #0             @ inicializa el índice externo del bucle
outer_loop:
    mov r3, r2             @ copia el índice externo a r3

inner_loop:
    ldr r4, [r0, r3, lsl #2]   @ carga el elemento actual
    ldr r5, [r0, r3, lsl #2]   @ carga el siguiente elemento

    cmp r4, r5                 @ compara los elementos
    ble no_swap                @ salta si no es necesario intercambiar

    str r5, [r0, r3, lsl #2]   @ guarda el elemento actual en la posición siguiente
    str r4, [r0, r3, lsl #2]   @ guarda el siguiente elemento en la posición actual

no_swap:
    add r3, r3, #1            @ mueve al siguiente elemento
    cmp r3, r1                @ compara con la longitud de la lista
    blt inner_loop            @ repite el bucle interno si no se ha alcanzado el final

    add r2, r2, #1            @ mueve al siguiente elemento para el bucle externo
    cmp r2, r1                @ compara con la longitud de la lista
    blt outer_loop            @ repite el bucle externo si no se ha alcanzado el final

    @ Imprimir la lista ordenada
    mov r0, #1                @ STDOUT
    ldr r1, =numbers          @ dir del inicio de la lista ordenada
    ldr r2, =length           @ longitud de la lista
    mov r7, #4                @ llamda al sistema: write
    swi 0

    mov r7, #1                @ salida del programa
    swi 0
