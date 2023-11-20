from PIL import Image

def read_mif(file_path, num_words):
    with open(file_path, 'r') as f:
        content = f.readlines()

    # Extraer las palabras del archivo MIF
    words = [int(line.split(':')[1].split(';')[0].strip(), 10) for line in content if line.startswith('\t')]

    # Tomar solo las primeras num_words palabras
    words = words[:num_words]

    return words

def create_image_from_mif(words, image_size):
    # Crear una imagen en blanco
    image = Image.new('L', image_size)

    # Establecer los píxeles de la imagen según las palabras en el archivo MIF
    image.putdata(words)

    return image

if __name__ == "__main__":
    mif_file_path = 'D:/TEC/tdd/squesada_ebarrantes_icalderon_digital_design_lab_2023/memoriaRam.mif'
    num_words_to_read = 10000
    image_size = (100, 100)  # Ajusta el tamaño de la imagen según tus necesidades

    mif_data = read_mif(mif_file_path, num_words_to_read)
    image = create_image_from_mif(mif_data, image_size)
    
    # Guardar la imagen
    image.save('D:/TEC/tdd/squesada_ebarrantes_icalderon_digital_design_lab_2023/output_image.png')

