package com.example.proyectofinaldb.models.repositories;

import com.example.proyectofinaldb.models.Articulo;
import com.example.proyectofinaldb.models.interfaces.Repository;
import com.example.proyectofinaldb.util.ConexionDB;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ImplementArticulo implements Repository<Articulo> {

    private Connection getConnection() throws SQLException {
        return ConexionDB.getInstance();
    }

    @Override
    public List<Articulo> listar() {
        List<Articulo> articulos = new ArrayList<>();

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, nombre_articulo, categoria, estado_articulo, cantidad, fecha_adquisicion, proveedor,   FROM articulos;")) {

            while (rs.next()) {
                Articulo a = new Articulo();
                a.setId(rs.getInt("id"));
                a.setNombre(rs.getString("nombre_articulo"));
                a.setCategoria(rs.getString("categoria"));
                a.setEstado(rs.getString("estado_articulo"));
                a.setCantidad(rs.getInt("cantidad"));
                a.setFecha_adquisicion(rs.getDate("fecha_adquisicion"));
                a.setProveedor(rs.getString("proveedor"));
                articulos.add(a);
            }

        } catch (SQLException e) {

        }

        return articulos;
    }

    @Override
    public Articulo porId(Long id) {
        return null;
    }

    @Override
    public void guardar(Articulo alumno) {

    }

    @Override
    public void eliminar(Long id) {

    }

    public ObservableList<Articulo> listarFX() {
        ObservableList<Articulo> articulos = FXCollections.observableArrayList();

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, nombre_articulo, categoria, estado_articulo, cantidad, fecha_adquisicion, proveedor FROM articulos;")) {

            while (rs.next()) {
                Articulo a = new Articulo();
                a.setId(rs.getInt("id"));
                a.setNombre(rs.getString("nombre_articulo"));
                a.setCategoria(rs.getString("categoria"));
                a.setEstado(rs.getString("estado_articulo"));
                a.setCantidad(rs.getInt("cantidad"));
                a.setFecha_adquisicion(rs.getDate("fecha_adquisicion"));
                a.setProveedor(rs.getString("proveedor"));
                articulos.add(a);
            }

        } catch (SQLException e) {
            e.getMessage();
        }

        return articulos;
    }
}
