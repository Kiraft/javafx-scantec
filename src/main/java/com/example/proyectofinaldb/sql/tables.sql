DROP DATABASE IF EXISTS almacen;

CREATE DATABASE almacen;

USE almacen;

CREATE TABLE productos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_barras VARCHAR(255) NOT NULL,
    direccion_imagen VARCHAR(255) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO productos (nombre, precio, codigo_barras, direccion_imagen, stock) VALUES
(
    'Cocacola',
     30.00,
     2020,
     'src/main/resources/com/example/proyectofinaldb/assets/coca-sin-azucar.PNG',
     200
),
(
    'Pepsi',
    20.00,
    2021,
    'src/main/resources/com/example/proyectofinaldb/assets/pepsi.PNG',
    100
);

INSERT INTO productos (nombre, precio, codigo_barras, direccion_imagen, stock) VALUES
(
    'Galletas Marias',
    50.00,
    2022,
    'src/main/resources/com/example/proyectofinaldb/assets/galletas.PNG',
    50
),
(
    'Laptop Gamer',
    7000.00,
    2023,
    'src/main/resources/com/example/proyectofinaldb/assets/laptop.PNG',
    10
),
(
    'Paracetamol',
    50,
    7501557140407,
    'src/main/resources/com/example/proyectofinaldb/assets/paracetamol.PNG',
    30
);