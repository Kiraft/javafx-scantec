DROP DATABASE IF EXISTS almacen;

CREATE DATABASE almacen;

USE almacen;

CREATE TABLE productos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_barras VARCHAR(255) NOT NULL,
    direccion_imagen VARCHAR(255) NOT NULL
);

INSERT INTO productos (nombre, precio, codigo_barras, direccion_imagen) VALUES
(
'Cocacola', 30.00, 2020, 'C:/Users/Kiraft/Documents/Workstations/lector-codigo-barras/src/main/resources/com/example/proyectofinaldb/assets/coca-sin-azucar.PNG'
),
(
'Pepsi', 20.00, 2021, 'C:/Users/Kiraft/Documents/Workstations/lector-codigo-barras/src/main/resources/com/example/proyectofinaldb/assets/pepsi.PNG'
);

INSERT INTO productos (nombre, precio, codigo_barras, direccion_imagen) VALUES
(
'Galletas Marias', 50.00, 2022, 'C:/Users/Kiraft/Documents/Workstations/lector-codigo-barras/src/main/resources/com/example/proyectofinaldb/assets/galletas.PNG'
),
(
'Laptop Gamer', 7000.00, 2023, 'C:/Users/Kiraft/Documents/Workstations/lector-codigo-barras/src/main/resources/com/example/proyectofinaldb/assets/laptop.PNG'
);