package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.models.Articulo;
import com.example.proyectofinaldb.models.repositories.ImplementProducto;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.util.Date;
import java.util.ResourceBundle;

public class AlmacenController implements Initializable {


    @FXML
    private Label labelMayorExistencias;

    @FXML
    private Label labelMenosExistencias;

    @FXML
    private Label labelTotalArticulos;

    @FXML
    private TableView<Articulo> tableAlmacen;

    @FXML
    private TableColumn<Articulo, Integer> tableColCantidad;

    @FXML
    private TableColumn<Articulo, String> tableColCategoria;

    @FXML
    private TableColumn<Articulo, String> tableColEstado;

    @FXML
    private TableColumn<Articulo, Date> tableColFecha;

    @FXML
    private TableColumn<Articulo, Integer> tableColId;

    @FXML
    private TableColumn<Articulo, String> tableColNombre;

    @FXML
    private TableColumn<Articulo, String> tableColProveedor;

    ImplementProducto ia = new ImplementProducto();

    private ObservableList<Articulo> inventoryListData;
    public void inventoryShowDate(){
        inventoryListData = ia.listarFX();

        tableColId.setCellValueFactory( new PropertyValueFactory<>("CodigoBarras"));
        tableColNombre.setCellValueFactory( new PropertyValueFactory<>("nombre"));
        tableColCategoria.setCellValueFactory( new PropertyValueFactory<>("categoria"));
        tableColEstado.setCellValueFactory( new PropertyValueFactory<>("estado"));
        tableColCantidad.setCellValueFactory( new PropertyValueFactory<>("cantidad"));
        tableColFecha.setCellValueFactory( new PropertyValueFactory<>("fecha_adquisicion"));
        tableColProveedor.setCellValueFactory( new PropertyValueFactory<>("proveedor"));

        tableAlmacen.setItems(inventoryListData);
        labelTotalArticulos.setText(String.valueOf(ia.getTotal()));
        labelMenosExistencias.setText(ia.getMenosStok());
        labelMayorExistencias.setText(ia.getMayorStok());


    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        inventoryShowDate();
    }
}

