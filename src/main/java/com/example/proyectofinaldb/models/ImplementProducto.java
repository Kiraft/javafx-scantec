package com.example.proyectofinaldb.models;

import com.example.proyectofinaldb.models.interfaces.Repository;
import com.example.proyectofinaldb.util.ConexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ImplementProducto implements Repository<Producto> {

    private Connection getConnection() throws SQLException {
        return ConexionDB.getInstance();
    }
    @Override
    public List<Producto> listar() {
        return null;
    }

    @Override
    public Producto porId(Long id) {
        return null;
    }

    @Override
    public void guardar(Producto alumno) {

    }

    @Override
    public void eliminar(Long id) {

    }

    public Producto porCodigoBarras(String code) {
        Producto p = null;

        try (PreparedStatement stmt = getConnection().prepareStatement("SELECT * FROM productos where codigo_barras=?")) {
            stmt.setString(1, code);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    p = new Producto();
                    p.setId(rs.getLong("id"));
                    p.setNombre(rs.getString("nombre"));
                    p.setPrecio(rs.getDouble("precio"));
                    p.setCodigoBarras(rs.getString("codigo_barras"));
                    p.setDireccionImagen(rs.getString("direccion_imagen"));
                }
            }
        } catch (SQLException e) {
            System.out.println("No se hizo la lectura");
        }
        return p;
    }
}
