from PIL import Image

# Abre la imagen
image = Image.open("imagen/barcoBW.jpg")

# Convierte la imagen a escala de grises
gray_image = image.convert("L")

# Obtiene las dimensiones de la imagen
width, height = gray_image.size

# Obtiene los píxeles de la imagen en escala de grises
pixels = list(gray_image.getdata())

# Abre el archivo .mif para escritura
with open("memoriaRam.mif", "w") as mif_file:
    mif_file.write("-- Copyright (C) 2023  Intel Corporation. All rights reserved.\n")
    mif_file.write("-- Your use of Intel Corporation's design tools, logic functions\n")
    mif_file.write("-- and other software and tools, and any partner logic\n")
    mif_file.write("-- functions, and any output files from any of the foregoing\n")
    mif_file.write("-- (including device programming or simulation files), and any\n")
    mif_file.write("-- associated documentation or information are expressly subject\n")
    mif_file.write("-- to the terms and conditions of the Intel Program License\n")
    mif_file.write("-- Subscription Agreement, the Intel Quartus Prime License Agreement,\n")
    mif_file.write("-- the Intel FPGA IP License Agreement, or other applicable license\n")
    mif_file.write("-- agreement, including, without limitation, that your use is for\n")
    mif_file.write("-- the sole purpose of programming logic devices manufactured by\n")
    mif_file.write("-- Intel and sold by Intel or its authorized distributors.  Please\n")
    mif_file.write("-- refer to the applicable agreement for further details, at\n")
    mif_file.write("-- https://fpgasoftware.intel.com/eula.\n")
    mif_file.write("\n")
    mif_file.write("-- Quartus Prime generated Memory Initialization File (.mif)\n")
    mif_file.write("\n")
    mif_file.write("WIDTH=8;\n")
    mif_file.write("DEPTH=10000;\n")
    mif_file.write("\n")
    mif_file.write("ADDRESS_RADIX=UNS;\n")
    mif_file.write("DATA_RADIX=UNS;\n")
    mif_file.write("\n")
    mif_file.write("CONTENT BEGIN\n")

    # Escribir los valores de los píxeles en el archivo .mif
    for i, pixel_value in enumerate(pixels):
        mif_file.write(f"    {i} : {pixel_value};\n")

    mif_file.write("END;\n")

# Cierra la imagen
image.close()
