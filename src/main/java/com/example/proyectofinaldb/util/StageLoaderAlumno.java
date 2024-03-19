package com.example.proyectofinaldb.util;
import com.example.proyectofinaldb.App;
import com.example.proyectofinaldb.controllers.NavbarController;
import com.example.proyectofinaldb.models.Usuario;
import javafx.event.Event;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.Window;
import java.io.IOException;

public class StageLoaderAlumno {

    public static void load(String url, Event event, Usuario usuario) throws IOException {
        Object eventSource = event.getSource();
        Node sourceAsNode = (Node) eventSource;
        Scene oldScene = sourceAsNode.getScene();
        Window window = oldScene.getWindow();
        Stage stage = (Stage) window;
        stage.hide();

        FXMLLoader loader = new FXMLLoader(App.class.getResource(url));
        Parent root = loader.load();

        Scene scene = new Scene(root);
        stage.setScene(scene);

        if (usuario != null) {
            Object controller = loader.getController();

            if (controller instanceof NavbarController) {
                NavbarController navbarController = (NavbarController) controller;
                navbarController.setUsuarioInScreen(usuario);
            }
//            else if (controller instanceof MainController) {
//                MainController archivoController = (MainController) controller;
//                archivoController.setAlumno(alumno);
//            }
        }

        stage.show();
    }
}
