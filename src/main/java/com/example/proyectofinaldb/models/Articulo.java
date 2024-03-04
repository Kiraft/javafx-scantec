package com.example.proyectofinaldb.models;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Articulo {
    Integer id;
    String nombre;
    String categoria;
    String estado;
    Integer cantidad;
    Date fecha_adquisicion;
    String proveedor;
    String direccionImagen;
    String CodigoBarras;
    Double precio;
    String descripcion;

    @Override
    public String toString() {
        return "Articulo{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", categoria='" + categoria + '\'' +
                ", estado='" + estado + '\'' +
                ", cantidad=" + cantidad +
                ", fecha_adquisicion=" + fecha_adquisicion +
                ", proveedor='" + proveedor + '\'' +
                ", direccionImagen='" + direccionImagen + '\'' +
                ", CodigoBarras='" + CodigoBarras + '\'' +
                ", precio=" + precio +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}
