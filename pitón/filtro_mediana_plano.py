import random

SIZE = 3
IMAG = {}


# Esta función no será necesaria en ensamblador. Es para simular la imagen cargada en memoria
def generar_imagen_mem():
    byte = 0
    for i in range(SIZE):
        for j in range(SIZE):
            IMAG[byte] = random.randint(0, 255)
            byte += 4


# Las siguientes funciones son para recorrer la matriz plana.
# for(int i = 0; i < size * size; i++)
#        print("Elemento", i, "=", IMAG[0 + offset_imag])
def for_i_ini():
    generar_imagen_mem()  # Cargar la posicion de memoria donde se encuentra el inicio de la imagen tal vez?
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
    offset += 4
    print("Elemento", i, "=", elem)

    # Acá, en vez de imprimir el valor de la imagen, se haría el filtrado de la imagen.
    i = i + 1
    if i < max_i:
        return for_i_body(i, max_i, offset)  # branch a etiqueta for_j_body

    return for_i_end()  # branch incondicional a etiqueta for_j_end


def for_i_end():
    print("Fin del recorrido de la imagen")


for_i_ini()
