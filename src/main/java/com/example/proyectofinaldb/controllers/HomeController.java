package com.example.proyectofinaldb.controllers;

import javafx.scene.control.Alert.AlertType;

import com.example.proyectofinaldb.models.repositories.ImplementProducto;
import com.example.proyectofinaldb.models.Producto;
import com.example.proyectofinaldb.util.AlertUtil;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class HomeController {

    @FXML
    private ImageView ImageProduct;

    @FXML
    private Label LabelPrice;

    @FXML
    private Button btnAgregar;

    @FXML
    private Button btnBuscar;

    @FXML
    private Pane contenedorLeerProducto;

    @FXML
    private Pane contenedorRegistrarProducto;

    @FXML
    private Label labelName;

    @FXML
    private Label labelName1;

    @FXML
    private TextField txtCode;

    @FXML
    private TextField txtNombre;

    @FXML
    private TextField txtPrecio;

    @FXML
    private TextField txtStock;

    @FXML
    void agregar(ActionEvent event) {

    }

    ImplementProducto implementProducto = new ImplementProducto();
    @FXML
    void buscar(ActionEvent event) throws FileNotFoundException {
        if (!txtCode.getText().isEmpty()){

            if (implementProducto.porCodigoBarras(txtCode.getText()) != null){

                contenedorLeerProducto.setVisible(true);
                Producto p = implementProducto.porCodigoBarras(txtCode.getText());

                labelName.setText(p.getNombre());
                LabelPrice.setText(String.valueOf(p.getPrecio()));
                Image img = new Image(new FileInputStream(p.getDireccionImagen()));
                ImageProduct.setImage(img);
            }else{
                contenedorRegistrarProducto.setVisible(true);
                txtCodigoBarras.setText(txtCode.getText());
            }

        }else{
            AlertUtil.showAlert(AlertType.ERROR, "Error codigo barras", "EL CAMPO ESTA VACIO");
        }

    }



}

