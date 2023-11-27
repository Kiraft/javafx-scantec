package com.example.proyectofinaldb.models.repositories;

import com.example.proyectofinaldb.models.Usuario;
import com.example.proyectofinaldb.models.interfaces.Repository;
import com.example.proyectofinaldb.util.ConexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ImplementUsuario implements Repository<Usuario> {
    private Connection getConnection() throws SQLException {
        return ConexionDB.getInstance();
    }
    @Override
    public List<Usuario> listar() {
        return null;
    }

    @Override
    public Usuario porId(Long id) {
        return null;
    }

    @Override
    public void guardar(Usuario alumno) {

    }

    @Override
    public void eliminar(Long id) {

    }

    public int login(String user, String password) {
        int state = -1;

        try (PreparedStatement pst = getConnection().prepareStatement("SELECT * FROM usuarios WHERE user = ? AND password = ?")){

            pst.setString(1, user);
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    state = 1;
                } else {
                    state = 0;
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return state;
    }

    public Usuario porUsuario (String user){
        Usuario u = null;
        String sql = "SELECT * FROM usuarios where user = ?;";

        try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
            stmt.setString(1, user);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    u = new Usuario();
                    u.setId(rs.getLong("id"));
                    u.setUser(rs.getString("user"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            System.out.println("CUENTA - Por Usuario");
        }
        return u;
    }
}
