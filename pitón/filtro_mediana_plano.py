import random

SIZE = 5
tamaño_fila = SIZE * 4
IMAG = {}
offsets = [-tamaño_fila - 4, -tamaño_fila, -tamaño_fila + 4, -4, 0, 4, tamaño_fila - 4, tamaño_fila, tamaño_fila + 4]
lista_vecinos = []

# 0  4  8  12 16
# 20 24 28 32 36
# 40 44 48 52 56
# 60 64 68 72 76
# 80 84 88 92 96


# Esta función no será necesaria en ensamblador. Es para simular la imagen cargada en memoria
def generar_imagen_mem():
    byte = 0
    for i in range(SIZE):
        for j in range(SIZE):
            IMAG[byte] = byte
            byte += 4


# Las siguientes funciones son para recorrer la matriz plana.
# for(int i = 0; i < size * size; i++)
#        print("Elemento", i, "=", IMAG[0 + offset_imag])
def for_i_ini():
    generar_imagen_mem()  # Cargar la posicion de memoria donde se encuentra el inicio de la imagen
    print("Imagen original:", IMAG, "\n\n")
    print("Inicio del recorrido de la imagen")
    i = 0  # reg temporal
    max_i = SIZE * SIZE  # reg temporal
    offset = 0
    return for_i_body(i, max_i, offset)  # No sería un branch, pasaría al body de i por gravedad.


def for_i_body(i, max_i, offset):
    # Imprimir el valor de la imagen en la posición i, j. El 0 representa la posición de memoria del primer elemento
    # de la imagen.
    elem = IMAG[offset]
    #print("Elemento", i, "=", elem)
    for_vecinos_ini(offset)

    offset += 4
    i = i + 1
    if i < max_i:
        return for_i_body(i, max_i, offset)  # branch a etiqueta for_j_body

    return for_i_end()  # branch incondicional a etiqueta for_j_end


def for_vecinos_ini(offset):
    j = 0  # reg temporal
    max_j = 9  # reg temporal
    for_vecinos_body(offset, j, max_j)


def for_vecinos_body(offset, j, max_j):
    row_size = SIZE * 4
    vecino = offset + offsets[j]

    print(offset, vecino)
    # Check if the neighbor index is within the valid range
    if 0 <= vecino < SIZE * SIZE * 4:
        # Check if the neighbor is within the same column or adjacent columns
        if abs((vecino % row_size) - (offset % row_size)) <= 4:
            # Check if the neighbor is within the same row or adjacent rows
            if abs((vecino // row_size) - (offset // row_size)) <= 1:
                lista_vecinos.append(IMAG[vecino])

    j = j + 1
    if j < max_j:
        return for_vecinos_body(offset, j, max_j)

    return for_vecinos_end()


def for_vecinos_end():
    print(lista_vecinos)
    lista_vecinos.clear()


def for_i_end():
    print("Fin del recorrido de la imagen")


for_i_ini()
