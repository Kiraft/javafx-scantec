package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.util.BarCodeGenerator;
import javafx.application.Platform;
import javafx.scene.control.Alert.AlertType;

import com.example.proyectofinaldb.models.repositories.ImplementProducto;
import com.example.proyectofinaldb.models.Producto;
import com.example.proyectofinaldb.util.AlertUtil;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.Pane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class HomeController {

    @FXML
    private ImageView ImageProduct;

    @FXML
    private Button btnAgregar;

    @FXML
    private Button btnBuscar;

    @FXML
    private Button btnCargarImg;

    @FXML
    private Pane contenedorLeerProducto;

    @FXML
    private Pane contenedorRegistrarProducto;

    @FXML
    private Pane contenedorSuccessfulRegister;

    @FXML
    private ImageView imgCodigoBarras;

    @FXML
    private ImageView imgRegister;

    @FXML
    private ImageView imgWelcome;

    @FXML
    private Label labelBarCode;

    @FXML
    private Label labelName;

    @FXML
    private Label labelName1;

    @FXML
    private Label labelPrice;

    @FXML
    private Label labelStock;

    @FXML
    private Label labelWelcome;

    @FXML
    private TextField txtCode;

    @FXML
    private TextField txtCodigoBarras;

    @FXML
    private TextField txtNombre;

    @FXML
    private TextField txtPrecio;

    @FXML
    private TextField txtStock;

    File fileImg = null;

    ImplementProducto implementProducto = new ImplementProducto();

    @FXML
    void agregar(ActionEvent event) throws FileNotFoundException {
        String nombreAux = txtNombre.getText() + ".png";
        Producto p = new Producto();
            p.setNombre(txtNombre.getText());
            p.setPrecio(Double.parseDouble(txtPrecio.getText()));
            p.setCodigoBarras(txtCodigoBarras.getText());
           if (fileImg == null){
               p.setDireccionImagen("src/main/resources/com/example/proyectofinaldb/assets/sinimagen.PNG");
           }else {
               p.setDireccionImagen(fileImg.getAbsolutePath());
           }
            p.setStock(Long.parseLong(txtStock.getText()));


        implementProducto.guardar(p);
        BarCodeGenerator.generatorBarCode(txtNombre.getText(), txtCodigoBarras.getText());
        contenedorRegistrarProducto.setVisible(false);
        contenedorSuccessfulRegister.setVisible(true);

        Thread hilo = new Thread(() -> {
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            Platform.runLater(() -> {
                Image img = null;
                try {
                    img = new Image(new FileInputStream("bar-codes/" + nombreAux));
                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
                imgCodigoBarras.setImage(img);
            });
        });

        hilo.start();

        clearFields();
        imgRegister.setImage(null);

    }

    private void clearFields() {
        txtNombre.clear();
        txtCodigoBarras.clear();
        txtPrecio.clear();
        txtStock.clear();
    }

    @FXML
    void buscar(ActionEvent event) throws FileNotFoundException {

        if (!txtCode.getText().isEmpty()){
            labelWelcome.setVisible(false);
            imgWelcome.setVisible(false);
            if (implementProducto.porCodigoBarras(txtCode.getText()) != null){
                contenedorSuccessfulRegister.setVisible(false);
                contenedorRegistrarProducto.setVisible(false);
                contenedorLeerProducto.setVisible(true);
                Producto p = implementProducto.porCodigoBarras(txtCode.getText());

                labelName.setText(p.getNombre());
                labelPrice.setText(String.valueOf(p.getPrecio()));
                labelStock.setText(String.valueOf(p.getStock()));
                labelBarCode.setText(String.valueOf(p.getCodigoBarras()));

//                String imagePath = "src/main/resources/com/example/proyectofinaldb/assets/coca-sin-azucar.PNG";
//                Image img = new Image(getClass().getResourceAsStream(imagePath));
//                ImageProduct.setImage(img);
                Image img = new Image(new FileInputStream(p.getDireccionImagen()));
                ImageProduct.setImage(img);
            }else{
                AlertUtil.showAlert(AlertType.ERROR, "PRODUCTO NO REGISTRADO", "Este producto no se encuentro en la base de datos registrelo");
                contenedorSuccessfulRegister.setVisible(false);
                contenedorLeerProducto.setVisible(false);
                contenedorRegistrarProducto.setVisible(true);
                txtCodigoBarras.setText(txtCode.getText());
            }

        }else{
            AlertUtil.showAlert(AlertType.ERROR, "Error codigo barras", "EL CAMPO ESTA VACIO");
        }

        txtCode.clear();

    }

    @FXML
    void enter(KeyEvent event) {
        if (event.getCode() == KeyCode.ENTER) {
            btnBuscar.fire();
        }
    }

    @FXML
    void cargarImg(ActionEvent event) {
        Thread hiloCargaArchivo = new Thread(() -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Selecciona un archivo");
            Stage stage = (Stage) btnCargarImg.getScene().getWindow();

            FileChooser.ExtensionFilter extensionFilter = new FileChooser.ExtensionFilter("Archivos de imagen", "*.png", "*.jpg", "*.jpeg");
            fileChooser.getExtensionFilters().add(extensionFilter);

            Runnable fileChooserRunnable = () -> {
                File file = fileChooser.showOpenDialog(stage);
                fileImg = file;
//                if (file != null) {
//
//                    // FileSystemView fileSystemView = FileSystemView.getFileSystemView();
//                    // File carpetaDestino = new File(fileSystemView.getHomeDirectory().getPath() + File.separator + "tramites-tecnm" + File.separator + "docs" + File.separator + nombreAlumno);
//                    File carpetaDestino = new File("C:/Users/Kiraft/Documents/Workstations/lector-codigo-barras/src/main/resources/com/example/proyectofinaldb/assets/");
//
//                    if (!carpetaDestino.exists()) {
//                        carpetaDestino.mkdirs();
//                    }
//
//                    File Destino = new File(carpetaDestino.getAbsolutePath() + File.separator + file.getName());
//
//                    if (file.renameTo(Destino)) {
//                        labelSubir.setStyle("-fx-background-color: #5CCF52; -fx-text-fill: white;");
//                        //Query de cargado de archivo
//                        ARDAO.setArchivo(alumno.getNumeroControl(), Destino.getAbsolutePath(), id_archivo);
//
//                        botonSubirArchivo.setDisable(true);
//                        imageView.setDisable(false);
//
//
//                    } else {
//                        AlertUtil.showAlert(AlertType.ERROR, "ERROR SUBIDA DE ARHIVO", "Errpr al guardar archivo");
//                    }
//
//
//                }
                Image img = null;
                try {
                    img = new Image(new FileInputStream(file.getAbsolutePath()));
                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
                imgRegister.setImage(img);
            };

            // Ejecuta el código en el hilo de eventos de JavaFX
            Platform.runLater(fileChooserRunnable);
        });
        hiloCargaArchivo.start();
    }

}





