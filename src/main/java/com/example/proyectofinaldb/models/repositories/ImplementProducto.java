package com.example.proyectofinaldb.models.repositories;

import com.example.proyectofinaldb.models.Articulo;
import com.example.proyectofinaldb.models.Producto;
import com.example.proyectofinaldb.models.interfaces.Repository;
import com.example.proyectofinaldb.util.ConexionDB;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;
import java.util.List;

public class ImplementProducto implements Repository<Articulo> {

    private Connection getConnection() throws SQLException {
        return ConexionDB.getInstance();
    }
    @Override
    public List<Articulo> listar() {
        return null;
    }

    @Override
    public Articulo porId(Long id) {
        return null;
    }

    @Override
    public void guardar(Articulo articulo) {
        String sql = "INSERT INTO articulos (nombre_articulo, precio, codigo_barras, direccion_imagen, proveedor, fecha_adquisicion, cantidad, estado_articulo, categoria, descripcion ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, articulo.getNombre());
            stmt.setDouble(2, articulo.getPrecio());
            stmt.setString(3, articulo.getCodigoBarras());
            stmt.setString(4, articulo.getDireccionImagen());
            stmt.setString(5, articulo.getProveedor());
            stmt.setDate(6, new Date(articulo.getFecha_adquisicion().getTime()));
            stmt.setInt(7, articulo.getCantidad());
            stmt.setString(8, "Disponible");
            stmt.setString(9, articulo.getCategoria());
            stmt.setString(10, articulo.getDescripcion());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void eliminar(Long id) {

    }

    public Articulo porCodigoBarras(String code) {
        Articulo a = null;

        try (PreparedStatement stmt = getConnection().prepareStatement("SELECT * FROM articulos where codigo_barras = ?")) {
            stmt.setString(1, code);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    a = new Articulo();
                    a.setId(rs.getInt("id"));
                    a.setNombre(rs.getString("nombre_articulo"));
                    a.setCategoria(rs.getString("categoria"));
                    a.setEstado(rs.getString("estado_articulo"));
                    a.setCantidad(rs.getInt("cantidad"));
                    a.setFecha_adquisicion(rs.getDate("fecha_adquisicion"));
                    a.setProveedor(rs.getString("proveedor"));
                    a.setDireccionImagen(rs.getString("direccion_imagen"));
                    a.setCodigoBarras(rs.getString("codigo_barras"));
                    a.setPrecio(rs.getDouble("precio"));
                    a.setDescripcion(rs.getString("descripcion"));
                }
            }
        } catch (SQLException e) {
            System.out.println("No se hizo la lectura");
        }
        return a;
    }

    public void eliminarPorCodigoBarras(String code){
        System.out.println(code);
        String sql = "DELETE FROM articulos WHERE codigo_barras = ?";

        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, code);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public void editar(Producto producto, Long id) {

        String sql = "UPDATE productos SET nombre = ?, precio = ?, codigo_barras = ?, direccion_imagen = ?, stock = ? where id = ?;";
        System.out.println(id);
        System.out.println(producto);
        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, producto.getNombre());
            stmt.setDouble(2, producto.getPrecio());
            stmt.setString(3, producto.getCodigoBarras());
            stmt.setString(4, producto.getDireccionImagen());
            stmt.setLong(5, producto.getStock());
            stmt.setLong(6, id);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public int getIdByCodigoBarras(String code){
        int id = 0;
        try (PreparedStatement stmt = getConnection().prepareStatement("SELECT id FROM productos where codigo_barras=?")) {
            stmt.setString(1, code);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    id = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            System.out.println("No se hizo la lectura");
        }
        return id;
    }

    public ObservableList<Articulo> listarFX() {
        ObservableList<Articulo> articulos = FXCollections.observableArrayList();

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, nombre_articulo, categoria, estado_articulo, cantidad, fecha_adquisicion, proveedor, direccion_imagen, codigo_barras, precio FROM articulos;")) {

            while (rs.next()) {
                Articulo a = new Articulo();
                a.setId(rs.getInt("id"));
                a.setNombre(rs.getString("nombre_articulo"));
                a.setCategoria(rs.getString("categoria"));
                a.setEstado(rs.getString("estado_articulo"));
                a.setCantidad(rs.getInt("cantidad"));
                a.setFecha_adquisicion(rs.getDate("fecha_adquisicion"));
                a.setProveedor(rs.getString("proveedor"));
                a.setDireccionImagen(rs.getString("direccion_imagen"));
                a.setCodigoBarras(rs.getString("codigo_barras"));
                a.setPrecio(rs.getDouble("precio"));
                articulos.add(a);
            }

        } catch (SQLException e) {
            e.getMessage();
        }

        return articulos;
    }
}
