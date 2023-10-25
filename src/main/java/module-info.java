module com.example.proyectofinaldb {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires java.sql;

    opens com.example.proyectofinaldb to javafx.fxml;
    exports com.example.proyectofinaldb;
    exports com.example.proyectofinaldb.controllers;
    opens com.example.proyectofinaldb.controllers to javafx.fxml;
    exports com.example.proyectofinaldb.models;
    opens com.example.proyectofinaldb.models to javafx.fxml;
    exports com.example.proyectofinaldb.models.interfaces;
    opens com.example.proyectofinaldb.models.interfaces to javafx.fxml;
}