import random

SIZE = 3
IMAG = {}


# Esta función no será necesaria en ensamblador. Es para simular la imagen cargada en memoria
def generar_imagen_mem():
    byte = 0
    for i in range(SIZE):
        for j in range(SIZE):
            IMAG[byte] =  random.randint(0, 255)
            byte += 4


# Las siguientes funciones son para recorrer la matriz plana como una en 2D.
# Las funciones van a emular las etiquetas en ensamblador, por lo que se hará dos for anidados "a pata".
# for(int i = 0; i < size; i++)
#     for(int j = 0; j < size; j++)
#        print("IMAG[", i, "][", j, "] =", IMAG[i][j])
def for_i_ini():
    generar_imagen_mem()  # Cargar la posicion de memoria donde se encuentra el inicio de la imagen tal vez?
    print("Imagen original:", IMAG, "\n\n")
    print("Inicio del recorrido de la imagen")
    i = 0  # reg temporal
    max_i = SIZE  # reg temporal
    return for_i_body(i, max_i)  # No sería un branch, pasaría al body de i por gravedad.


def for_i_body(i, max_i):
    return for_j_ini(i, max_i)  # De nuevo, no sería un branch, pasaría al body de j por gravedad.


def for_j_ini(i, max_i):
    j = 0  # reg temporal
    max_j = SIZE  # reg temporal
    return for_j_body(i, j, max_i, max_j)  # Sin branch


def for_j_body(i, j, max_i, max_j):
    offset_imag = 4 * (i * SIZE + j)  # reg temporal

    # Imprimir el valor de la imagen en la posición i, j. El 0 representa la posición de memoria del primer elemento
    # de la imagen.
    print("IMAG[", i, "][", j, "] =", IMAG[0 + offset_imag])

    # Acá, en vez de imprimir el valor de la imagen, se haría el filtrado de la imagen.

    j = j + 1
    if j < max_j:
        return for_j_body(i, j, max_i, max_j)  # branch a etiqueta for_j_body

    return for_j_end(i, max_i)  # branch incondicional a etiqueta for_j_end


def for_j_end(i, max_i):
    i = i + 1
    if i < max_i:
        return for_i_body(i, max_i)  # branch a etiqueta for_i_body

    return for_i_end()


def for_i_end():
    print("Fin del recorrido de la imagen")


for_i_ini()
