DROP DATABASE IF EXISTS almacen2;

CREATE DATABASE almacen2;

USE almacen2;


CREATE TABLE solicitantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    direccion VARCHAR(255),
    numero_contacto VARCHAR(20),
    correo_electronico VARCHAR(100),
    otros_datos TEXT
);

CREATE TABLE ubicacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    detalles_ubicacion VARCHAR(255),
    tipo_almacenamiento VARCHAR(50),
    capacidad INT
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_inventario VARCHAR(50),
    fecha_caducidad DATE,
    numero_lote VARCHAR(50),
    estado_stock VARCHAR(50)
);


CREATE TABLE articulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ubicacion INT,
    id_inventario INT,
    nombre_articulo VARCHAR(100),
    descripcion TEXT,
    categoria VARCHAR(50),
    estado_articulo VARCHAR(50),
    cantidad INT,
    fecha_adquisicion DATE,
    proveedor VARCHAR(100),
    direccion_imagen VARCHAR(255),
    codigo_barras VARCHAR(255),
    precio DOUBLE,
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id),
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);

CREATE TABLE ingreso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(10, 2),
    marca VARCHAR(50),
    fecha_ingreso DATE,
    metodo_adquisicion VARCHAR(50),
    articulos_id INT,

    FOREIGN KEY (articulos_id) REFERENCES articulos(id)

);

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado_prestamo VARCHAR(50),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    observaciones_adicionales TEXT,
    id_solicitante INT,
    id_articulo INT,
    FOREIGN KEY (id_solicitante) REFERENCES solicitantes(id),
    FOREIGN KEY (id_articulo) REFERENCES articulos(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(50),
    password VARCHAR(50),
    rol VARCHAR(255)
);

SOURCE insert_ubicacion.sql;
