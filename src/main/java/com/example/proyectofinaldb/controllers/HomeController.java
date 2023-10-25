package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.models.ImplementProducto;
import com.example.proyectofinaldb.models.Producto;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
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
    private Button btnBuscar;

    @FXML
    private Pane contenedorProducto;

    @FXML
    private Label labelName;

    @FXML
    private TextField txtCode;

    ImplementProducto implementProducto = new ImplementProducto();
    @FXML
    void buscar(ActionEvent event) throws FileNotFoundException {
//        String code = txtCode.getText();
        Producto p = implementProducto.porCodigoBarras(txtCode.getText());

        labelName.setText(p.getNombre());
        LabelPrice.setText(String.valueOf(p.getPrecio()));
        Image img = new Image(new FileInputStream(p.getDireccionImagen()));
        ImageProduct.setImage(img);
    }



}

