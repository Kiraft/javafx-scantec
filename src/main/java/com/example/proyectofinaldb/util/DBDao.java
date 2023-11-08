package com.example.proyectofinaldb.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBDao {

    private Connection getConnection() throws SQLException {
        return ConexionDB.getInstance();
    }

    public List<String> getColumuns(String nombreTabla){

        List<String> nombresColumnas = new ArrayList<>();

        try (Connection connection = getConnection()) {
            ResultSet resultSet = connection.getMetaData().getColumns(null, null, nombreTabla, null);

            while (resultSet.next()) {
                String nombreColumna = resultSet.getString("COLUMN_NAME");
                int tipoDato = resultSet.getInt("DATA_TYPE");
                int columnaNoEsPK = resultSet.getInt("ORDINAL_POSITION");

                if (tipoDato == java.sql.Types.INTEGER && columnaNoEsPK != 1 && !esClaveForanea(connection, nombreTabla, nombreColumna)) {
                    nombresColumnas.add(nombreColumna);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nombresColumnas;
    }

    private boolean esClaveForanea(Connection connection, String nombreTabla, String nombreColumna) throws SQLException {
        ResultSet resultSet = connection.getMetaData().getImportedKeys(connection.getCatalog(), null, nombreTabla);

        while (resultSet.next()) {
            String nombreColumnaForanea = resultSet.getString("FKCOLUMN_NAME");
            if (nombreColumnaForanea.equals(nombreColumna)) {
                return true;
            }
        }

        return false;
    }
}


