package com.example.proyectofinaldb.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;

public class LoginController {


    @FXML
    private Button btnLogin;

    @FXML
    private Button btnRecoverBack;

    @FXML
    private Button btnRecoverValidate;

    @FXML
    private Pane containerLogin;

    @FXML
    private Pane containerRecoverUser;

    @FXML
    private Label labelRecover;

    @FXML
    private PasswordField txtPassword;

    @FXML
    private TextField txtRecoverEmail;

    @FXML
    private TextField txtRecoverMatricula;

    @FXML
    private TextField txtUser;
    
    @FXML
    private void LoginAndRegister(ActionEvent event) {
        
        Node source = (Node) event.getSource();
        switch (source.getId()) {
            case "btnLogin": 
                handleLogin(event);
                break;
            case "btnRegister": 
//                handleRegister();
                break;
        
            default:
                break;
        }

    }


    @FXML
    void backLogin(ActionEvent event) {
        containerRecoverUser.setVisible(false);
        containerLogin.setVisible(true);
    }

    @FXML
    void labelRecover(MouseEvent event) {
        containerLogin.setVisible(false);
        containerRecoverUser.setVisible(true);
        
    }

    @FXML
    void inOverMouse(MouseEvent event) {
        labelRecover.setUnderline(true);
    }

    @FXML
    void outOverMouse(MouseEvent event) {
        labelRecover.setUnderline(false);
    }


    private void handleLogin(ActionEvent event) {
//        if (!txtUser.getText().isEmpty() && !txtPassword.getText().isEmpty()) {
//
//            String matricula = txtUser.getText();
//            String pass = txtPassword.getText();
//
//            int state = rp.login(matricula, pass);
//
//            if (state != -1) {
//                if (state == 1) {
//                    try {
//                        // MatriculaModel matriculaModel = new MatriculaModel(matricula);
//                        StageLoaderAlumno.load("viewLandingPage.fxml", event, rp.porMatricula(matricula));
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                } else {
//
//                    AlertUtil.showAlert(AlertType.ERROR, "Error inicio de sesion", "Datos incorrectos intentalo de nuevo");
//                }
//            }else {
//
//                AlertUtil.showAlert(AlertType.ERROR, "Error inicio de sesion", "Problema servidores intentelo mas tarde");
//            }
//
//        } else {
//            AlertUtil.showAlert(AlertType.ERROR, "Error inicio de sesion", "Campos vacios porfavor llenarlos");
//        }
//
    }

}

