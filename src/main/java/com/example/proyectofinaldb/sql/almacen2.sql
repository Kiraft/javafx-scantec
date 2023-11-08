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

INSERT INTO ubicacion (detalles_ubicacion, tipo_almacenamiento, capacidad)
VALUES
('Estantería A1', 'Almacenamiento seco', 100),
('Estante B2', 'Almacenamiento frío', 50),
('Armario C3', 'Almacenamiento seco', 80),
('Anaquel D4', 'Almacenamiento seco', 120),
('Estante E5', 'Almacenamiento seco', 70),
('Estante E6', 'Almacenamiento seco', 70);


INSERT INTO inventario (tipo_inventario, fecha_caducidad, numero_lote, estado_stock)
VALUES
('Productos de limpieza', '2024-06-30', 'Lote-123', 'Disponible'),
('Medicamentos', '2023-12-15', 'Lote-456', 'Agotado'),
('Herramientas', NULL, 'Lote-789', 'Disponible'),
('Electrodomésticos', '2025-02-28', 'Lote-101', 'Disponible'),
('Ropa', '2024-09-20', 'Lote-202', 'Disponible'),
('Computacion', '2024-09-20', 'Lote-201', 'Disponible');

INSERT INTO solicitantes (nombre_completo, direccion, numero_contacto, correo_electronico, otros_datos)
VALUES
('Ana Pérez', 'Calle Principal 123', '555-1234', 'ana@email.com', 'Cliente preferente'),
('Carlos Gómez', 'Avenida Central 456', '555-5678', 'carlos@email.com', 'Membresía Gold'),
('María López', 'Calle Nueva 789', '555-2468', 'maria@email.com', 'Nuevo cliente'),
('Javier Rodríguez', 'Calle Larga 101', '555-7890', 'javier@email.com', 'Frecuente'),
('Sofía Martínez', 'Avenida Sur 333', '555-1357', 'sofia@email.com', 'Cliente VIP');

INSERT INTO articulos (id, id_ubicacion, id_inventario, nombre_articulo, descripcion, categoria, estado_articulo, cantidad, fecha_adquisicion, proveedor, direccion_imagen, codigo_barras, precio)
VALUES
(1, 1, 1, 'Limpiador multiusos', 'Elimina la suciedad y desinfecta.', 'Limpieza', 'Disponible', 100, '2023-05-10', 'Proveedor X', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/limpiador-multiusos.PNG', 1, 30),
(2, 3, 2, 'Medicamento A', 'Alivia dolores leves.', 'Medicina', 'Agotado', 0, '2023-07-25', 'Farmacia Y', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/paracetamol.PNG', 2, 50),
(3, 4, 3, 'Martillo', 'Herramienta para golpear.', 'Herramientas', 'Disponible', 20, '2023-09-01', 'Ferreteria Z', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/martillo.PNG', 3, 60),
(4, 2, 4, 'Refrigerador', 'Electrodoméstico para conservar alimentos.', 'Electrodomesticos', 'Disponible', 5, '2023-06-15', 'Tienda Electro', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/refrijerador.PNG', 4, 5000),
(5, 5, 5, 'Camiseta', 'Prenda de vestir.', 'Ropa', 'Disponible', 30, '2023-10-02', 'Tienda Moda', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/camiseta.PNG', 5, 150),
(6, 6, 6, 'Laptop Machinike', 'Computadora Gaming', 'Computacion', 'Disponible', 30, '2023-11-02', 'Machinike', 'src/main/resources/com/example/proyectofinaldb/assets/img/articulos/laptop.PNG', 6111, 20000);

INSERT INTO ingreso (precio, marca, fecha_ingreso, metodo_adquisicion, articulos_id)
VALUES
(50.00, 'MarcaX', '2023-05-10', 'Compra directa', 1),
(30.00, 'MarcaY', '2023-07-25', 'Proveedor Z', 2),
(100.00, 'MarcaZ', '2023-09-01', 'Subasta', 3),
(80.00, 'MarcaX', '2023-06-15', 'Compra directa', 4),
(70.00, 'MarcaY', '2023-10-02', 'Proveedor A', 5);

INSERT INTO prestamos (estado_prestamo, fecha_prestamo, fecha_devolucion, observaciones_adicionales, id_solicitante, id_articulo)
VALUES
('En proceso', '2023-07-15', '2023-07-25', 'Ninguna', 1, 1),
('Devuelto', '2023-08-03', '2023-08-20', 'Sin daños', 2, 3),
('En proceso', '2023-09-10', NULL, 'Solicitante nuevo', 3, 2),
('Devuelto', '2023-06-28', '2023-07-10', 'Pequeños arañazos', 1, 4),
('En proceso', '2023-10-05', NULL, 'Sin comentarios', 4, 5);
