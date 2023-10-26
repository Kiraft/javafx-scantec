package com.example.proyectofinaldb.models.repositories;

import com.example.proyectofinaldb.models.Producto;
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
    public void guardar(Producto producto) {
        String sql = "INSERT INTO productos (nombre, precio, codigo_barras, direccion_imagen, stock) VALUES (?, ?, ?, ?, ?);";

        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, producto.getNombre());
            stmt.setDouble(2, producto.getPrecio());
            stmt.setString(3, producto.getCodigoBarras());
            stmt.setString(4, producto.getDireccionImagen());
            stmt.setLong(5, producto.getStock());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
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
                    p.setStock(rs.getLong("stock"));
                }
            }
        } catch (SQLException e) {
            System.out.println("No se hizo la lectura");
        }
        return p;
    }

    public void eliminarPorCodigoBarras(String code){
        System.out.println(code);
        String sql = "DELETE FROM productos WHERE codigo_barras = ?";

        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, code);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
}
