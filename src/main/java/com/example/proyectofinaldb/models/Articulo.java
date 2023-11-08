package com.example.proyectofinaldb.models;

import java.util.Date;

public class Articulo {
    Integer id;
    String nombre;
    String categoria;
    String estado;
    Integer cantidad;
    Date fecha_adquisicion;
    String proveedor;

    public Articulo() {
    }

    public Articulo(Integer id, String nombre, String categoria, String estado, Integer cantidad, Date fecha_adquisicion, String proveedor) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.estado = estado;
        this.cantidad = cantidad;
        this.fecha_adquisicion = fecha_adquisicion;
        this.proveedor = proveedor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha_adquisicion() {
        return fecha_adquisicion;
    }

    public void setFecha_adquisicion(Date fecha_adquisicion) {
        this.fecha_adquisicion = fecha_adquisicion;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

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
                '}';
    }
}
