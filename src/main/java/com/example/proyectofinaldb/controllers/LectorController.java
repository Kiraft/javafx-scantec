package com.example.proyectofinaldb.controllers;

import com.example.proyectofinaldb.models.Articulo;
import com.example.proyectofinaldb.util.BarCodeGenerator;
import javafx.application.Platform;
import javafx.scene.control.Alert.AlertType;

import com.example.proyectofinaldb.models.repositories.ImplementProducto;
import com.example.proyectofinaldb.models.Producto;
import com.example.proyectofinaldb.util.AlertUtil;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
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
import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;

public class LectorController {

    @FXML
    private ImageView ImageProduct;

    @FXML
    private Button btnAgregar;

    @FXML
    private Button btnBuscar;

    @FXML
    private Button btnCargarImg;

    @FXML
    private Button btnCargarImgEdit;

    @FXML
    private Button btnEditar;

    @FXML
    private Button btnEliminar;

    @FXML
    private Button btnGuardarEdit;

    @FXML
    private Pane contenedorEditProducto;

    @FXML
    private Pane contenedorLeerProducto;

    @FXML
    private Pane contenedorRegistrarProducto;

    @FXML
    private Pane contenedorSuccessfulRegister;

    @FXML
    private Pane contenedorSuccessfulUpdate;

    @FXML
    private DatePicker datePicker;

    @FXML
    private ImageView imgCodigoBarras;

    @FXML
    private ImageView imgEdit;

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
    private Label labelName11;

    @FXML
    private Label labelName12;

    @FXML
    private Label labelPrice;

    @FXML
    private Label labelStock;

    @FXML
    private Label labelWelcome;

    @FXML
    private TextField txtCategoria;

    @FXML
    private TextField txtCode;

    @FXML
    private TextField txtCodigoBarras;

    @FXML
    private TextField txtDescripcion;

    @FXML
    private TextField txtEditCategoria;

    @FXML
    private TextField txtEditCodigo;

    @FXML
    private TextField txtEditDescripcion;

    @FXML
    private TextField txtEditEstado;

    @FXML
    private TextField txtEditNombre;

    @FXML
    private TextField txtEditPrecio;

    @FXML
    private TextField txtEditProveedor;

    @FXML
    private TextField txtEditStock;

    @FXML
    private TextField txtNombre;

    @FXML
    private TextField txtPrecio;

    @FXML
    private TextField txtProveedor;

    @FXML
    private TextField txtStock;


    File fileImg = null;
    File fileimgEdit = null;

    ImplementProducto implementProducto = new ImplementProducto();

    @FXML
    void agregar(ActionEvent event) throws FileNotFoundException {
        String nombreAux = txtNombre.getText() + ".png";
        Articulo a = new Articulo();
            a.setNombre(txtNombre.getText());
            a.setPrecio(Double.parseDouble(txtPrecio.getText()));
            a.setCodigoBarras(txtCodigoBarras.getText());
           if (fileImg == null){
               a.setDireccionImagen("src/main/resources/com/example/proyectofinaldb/assets/sinimagen.PNG");
           }else {
               a.setDireccionImagen(fileImg.getAbsolutePath());
           }
           a.setCantidad(Integer.parseInt(txtStock.getText()));
           a.setDescripcion(txtDescripcion.getText());
            LocalDate selectedDate = datePicker.getValue();
            if (selectedDate != null) {
                Date date = java.sql.Date.valueOf(selectedDate);
                a.setFecha_adquisicion(date);
            }
            a.setProveedor(txtProveedor.getText());
            a.setCategoria(txtCategoria.getText());



        implementProducto.guardar(a);

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


    @FXML
    void buscar(ActionEvent event) throws FileNotFoundException {

        if (!txtCode.getText().isEmpty()){
            contenedorEditProducto.setVisible(false);
            contenedorSuccessfulUpdate.setVisible(false);
            labelWelcome.setVisible(false);
            imgWelcome.setVisible(false);
            if (implementProducto.porCodigoBarras(txtCode.getText()) != null){
                contenedorSuccessfulRegister.setVisible(false);
                contenedorRegistrarProducto.setVisible(false);
                contenedorLeerProducto.setVisible(true);
                Articulo a = implementProducto.porCodigoBarras(txtCode.getText());

                labelName.setText(a.getNombre());
                labelPrice.setText(String.valueOf(a.getPrecio()));
                labelStock.setText(String.valueOf(a.getCantidad()));
                labelBarCode.setText(String.valueOf(a.getCodigoBarras()));

                Image img = new Image(new FileInputStream(a.getDireccionImagen()));
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

    @FXML
    void eliminar(ActionEvent event) {
        implementProducto.eliminarPorCodigoBarras(labelBarCode.getText());
        AlertUtil.showAlert(AlertType.CONFIRMATION, "EXITOSO", "SE A ELIMINADO EL PRODUCTO");
        contenedorLeerProducto.setVisible(false);
        imgWelcome.setVisible(true);
        labelWelcome.setVisible(true);
    }
    @FXML
    void editar(ActionEvent event) {


        contenedorLeerProducto.setVisible(false);
        contenedorEditProducto.setVisible(true);

        Articulo a = implementProducto.porCodigoBarras(labelBarCode.getText());

        txtEditNombre.setText(a.getNombre());
        txtEditPrecio.setText((a.getPrecio()).toString());
        txtEditStock.setText((a.getCantidad()).toString());
        txtEditCodigo.setText(a.getCodigoBarras());
        imgEdit.setImage(ImageProduct.getImage());
        txtEditCategoria.setText(a.getCategoria());
        txtEditDescripcion.setText(a.getDescripcion());
        txtEditEstado.setText(a.getEstado());
        txtEditProveedor.setText(a.getProveedor());

        idAux = a.getId();
        System.out.println(idAux);
    }

    int idAux = 0;
    @FXML
    void guardar(ActionEvent event) {
        Integer idAuxLong = idAux;

        Articulo a =  new Articulo();
        a.setNombre(txtEditNombre.getText());
        a.setPrecio(Double.parseDouble(txtEditPrecio.getText()));
        a.setCantidad(Integer.parseInt(txtEditStock.getText()));
        a.setProveedor(txtEditProveedor.getText());
        a.setEstado(txtEditEstado.getText());
        a.setCategoria(txtEditCategoria.getText());
        a.setDescripcion(txtEditDescripcion.getText());
//        if (fileimgEdit == null){
//            p.setDireccionImagen("src/main/resources/com/example/proyectofinaldb/assets/sinimagen.PNG");
//        }else {
//            p.setDireccionImagen(fileimgEdit.getAbsolutePath());
//        }
        a.setDireccionImagen("src/main/resources/com/example/proyectofinaldb/assets/sinimagen.PNG");

        implementProducto.editar(a, idAuxLong);

        contenedorEditProducto.setVisible(false);
        contenedorSuccessfulUpdate.setVisible(true);

    }

    String editNombre;
    String editPrecio;
    String editStock;
    String editCoodigo;

    @FXML
    void cargarImgEdit(ActionEvent event) {
        Thread hiloCargaArchivo = new Thread(() -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Selecciona un archivo");
            Stage stage = (Stage) btnCargarImg.getScene().getWindow();

            FileChooser.ExtensionFilter extensionFilter = new FileChooser.ExtensionFilter("Archivos de imagen", "*.png", "*.jpg", "*.jpeg");
            fileChooser.getExtensionFilters().add(extensionFilter);

            Runnable fileChooserRunnable = () -> {
                File file = fileChooser.showOpenDialog(stage);
                fileimgEdit = file;

                Image img = null;
                try {
                    img = new Image(new FileInputStream(file.getAbsolutePath()));
                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
                imgEdit.setImage(img);
            };

            // Ejecuta el código en el hilo de eventos de JavaFX
            Platform.runLater(fileChooserRunnable);
        });
        hiloCargaArchivo.start();
    }

    private void clearFields() {
        txtNombre.clear();
        txtCodigoBarras.clear();
        txtPrecio.clear();
        txtStock.clear();
    }
}





