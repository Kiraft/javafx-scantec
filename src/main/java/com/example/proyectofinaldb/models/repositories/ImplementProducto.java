package com.example.proyectofinaldb.models.repositories;

import com.example.proyectofinaldb.models.Articulo;
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

    public void editar(Articulo articulo, Integer id) {

        String sql = "UPDATE articulos SET nombre_articulo = ?, categoria = ?, precio = ?, direccion_imagen = ?, cantidad = ?, proveedor = ?, estado_articulo = ?, descripcion = ?  WHERE id = ?;";
//        System.out.println(id);
//        System.out.println(producto);
        try (PreparedStatement stmt = getConnection().prepareStatement(sql) ) {
            stmt.setString(1, articulo.getNombre());
            stmt.setString(2, articulo.getCategoria());
            stmt.setDouble(3, articulo.getPrecio());
            stmt.setString(4, articulo.getDireccionImagen());
            stmt.setInt(5, articulo.getCantidad());
            stmt.setString(6, articulo.getProveedor());
            stmt.setString(7, articulo.getEstado());
            stmt.setString(8, articulo.getDescripcion());
            stmt.setInt(9, id);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public int getTotal(){
        int total = 0;

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(id) AS total FROM articulos")) {

            if (rs.next()) {
                total = rs.getInt("total");
            }

        } catch (SQLException e) {
            e.getMessage();
        }
        return total;
    }

    public String getMenosStok(){
        int total = 0;
        String articulo = "NINGUNO";

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT nombre_articulo, MIN(cantidad) as total FROM articulos WHERE cantidad = (SELECT MIN(cantidad) FROM articulos)")) {

            if (rs.next()) {
                total = rs.getInt("total");
                articulo = rs.getString("nombre_articulo");
            }

        } catch (SQLException e) {
            e.getMessage();
        }


        return articulo + " " + total;
    }

    public String getMayorStok(){
        int total = 0;
        String articulo = "NINGUNO";

        try (Statement stmt = getConnection().createStatement();
             ResultSet rs = stmt.executeQuery("SELECT nombre_articulo, MAX(cantidad) as total FROM articulos WHERE cantidad = (SELECT MAX(cantidad) FROM articulos)")) {

            if (rs.next()) {
                total = rs.getInt("total");
                articulo = rs.getString("nombre_articulo");
            }

        } catch (SQLException e) {
            e.getMessage();
        }


        return articulo + " " + total;
    }
}
