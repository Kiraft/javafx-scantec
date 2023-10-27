package com.example.proyectofinaldb;

import com.example.proyectofinaldb.models.Producto;
import com.example.proyectofinaldb.models.repositories.ImplementProducto;

public class test {
    public static void main(String[] args) {
        ImplementProducto ip = new ImplementProducto();

        Producto p = new Producto();
        p.setNombre("LOLA");
        p.setPrecio(200.0);
        p.setStock(200L);
        p.setCodigoBarras("2022");
        p.setDireccionImagen("/huevos/xd");

        ip.guardar(p);


    }
}
