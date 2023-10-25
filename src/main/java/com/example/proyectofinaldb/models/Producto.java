package com.example.proyectofinaldb.models;

public class Producto {
    Long id;
    String nombre;
    Double precio;
    String codigoBarras;

    String direccionImagen;

    Long stock;

    public Producto() {
    }

    public Producto(Long id, String nombre, Double precio, String codigoBarras, String direccionImagen, Long stock) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.codigoBarras = codigoBarras;
        this.direccionImagen = direccionImagen;
        this.stock = stock;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getCodigoBarras() {
        return codigoBarras;
    }

    public void setCodigoBarras(String codigoBarras) {
        this.codigoBarras = codigoBarras;
    }

    public String getDireccionImagen() {
        return direccionImagen;
    }

    public void setDireccionImagen(String direccionImagen) {
        this.direccionImagen = direccionImagen;
    }

    public Long getStock() {
        return stock;
    }

    public void setStock(Long stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Producto{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", codigoBarras='" + codigoBarras + '\'' +
                ", direccionImagen='" + direccionImagen + '\'' +
                ", stock=" + stock +
                '}';
    }
}
