package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.App;
import com.example.proyectofinaldb.models.Usuario;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.Text;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class NavbarController implements Initializable {

    @FXML
    private Button btnAlmacen;

    @FXML
    private Button btnExit;

    @FXML
    private Button btnLector;

    @FXML
    private AnchorPane containerLeft;

    @FXML
    private Text labelNombre;

    Usuario usuario;
    public void setUsuarioInScreen (Usuario usuario){
        this.usuario = usuario;
    }
    @FXML
    void exit(ActionEvent event) {

    }



    @FXML
    void navbarChange(ActionEvent event) throws IOException {
        Node source = (Node) event.getSource();
        switch (source.getId()) {
            case "btnLector":

                FXMLLoader lectorLoader = new FXMLLoader(App.class.getResource("view_lector.fxml"));

                try {
                    Parent homeRoot = lectorLoader.load();
                    LectorController lectorController = lectorLoader.getController();
                    lectorController.setUsuarioInScreen(usuario);
                    containerLeft.getChildren().clear();
                    containerLeft.getChildren().add(homeRoot);
                } catch (IOException e) {
                    e.printStackTrace();
                }


                break;
            case "btnAlmacen":

                FXMLLoader almacenLoader = new FXMLLoader(App.class.getResource("view_almacen.fxml"));

                try {
                    Parent almacenRoot = almacenLoader.load();
                    containerLeft.getChildren().clear();
                    containerLeft.getChildren().add(almacenRoot);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                break;

            default:
                break;
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        Thread hilo = new Thread(() -> {
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            Platform.runLater(() -> {

                FXMLLoader lectorLoader = new FXMLLoader(App.class.getResource("view_lector.fxml"));

                try {
                    Parent homeRoot = lectorLoader.load();
                    LectorController lectorController = lectorLoader.getController();
                    lectorController.setUsuarioInScreen(usuario);
                    containerLeft.getChildren().clear();
                    containerLeft.getChildren().add(homeRoot);
                    labelNombre.setText(usuario.getRole());
                } catch (IOException e) {
                    e.printStackTrace();
                }

                System.out.println(usuario);
            });
        });

        hilo.start();
    }
}


