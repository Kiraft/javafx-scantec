package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.models.Articulo;
import com.example.proyectofinaldb.models.repositories.ImplementArticulo;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.util.Date;
import java.util.ResourceBundle;

public class AlmacenController implements Initializable {

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

    ImplementArticulo ia = new ImplementArticulo();

    private ObservableList<Articulo> inventoryListData;
    public void inventoryShowDate(){
        inventoryListData = ia.listarFX();

        tableColId.setCellValueFactory( new PropertyValueFactory<>("id"));
        tableColNombre.setCellValueFactory( new PropertyValueFactory<>("nombre"));
        tableColCategoria.setCellValueFactory( new PropertyValueFactory<>("categoria"));
        tableColEstado.setCellValueFactory( new PropertyValueFactory<>("estado"));
        tableColCantidad.setCellValueFactory( new PropertyValueFactory<>("cantidad"));
        tableColFecha.setCellValueFactory( new PropertyValueFactory<>("fecha_adquisicion"));
        tableColProveedor.setCellValueFactory( new PropertyValueFactory<>("proveedor"));

        tableAlmacen.setItems(inventoryListData);
    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        inventoryShowDate();
    }
}

