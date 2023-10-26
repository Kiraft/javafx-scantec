package com.example.proyectofinaldb.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer; // Importa el Code128Writer

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.EnumMap;
import java.util.Map;

public class BarCodeGenerator {
    public static void generatorBarCode(String nombre, String code){

        String barcodeData = code; // Datos que se codificarán en el código de barras
        String barcodeFile = nombre + ".png"; // Nombre del archivo PNG de salida

        int width = 300; // Ancho de la imagen del código de barras
        int height = 100; // Altura de la imagen del código de barras

        try {
            // Configurar el tipo de código de barras y el formato
            BarcodeFormat barcodeFormat = BarcodeFormat.CODE_128;

            // Configurar los parámetros de codificación
            Map<EncodeHintType, Object> hints = new EnumMap<>(EncodeHintType.class);
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

            // Crear el escritor del código de barras
            Writer writer = new Code128Writer(); // Utiliza Code128Writer
            BitMatrix bitMatrix = writer.encode(barcodeData, barcodeFormat, width, height, hints);

            // Convertir la matriz de bits en una imagen BufferedImage
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF);
                }
            }

            // Guardar la imagen del código de barras en formato PNG
            File outputFile = new File(barcodeFile);
            ImageIO.write(image, "png", outputFile);

            System.out.println("Código de barras CODE_128 generado con éxito en " + barcodeFile);
        } catch (WriterException | IOException e) {
            e.printStackTrace();
        }

    }


}
