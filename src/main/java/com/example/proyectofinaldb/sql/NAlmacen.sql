CREATE DATABASE NAlmacen;
USE NAlmacen;

CREATE TABLE prestamos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Estado_Prestamo VARCHAR(70),
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Observaciones_Adicionales VARCHAR(70)
);

-- Tabla: Solicitantes
CREATE TABLE solicitantes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(70),
    Otros_Datos VARCHAR(70),
    Direccion VARCHAR(70),
    Numero_Contacto VARCHAR(70),
    Correo_Electronico VARCHAR(70)
);

-- Tabla: Ubicacion
CREATE TABLE ubicacion (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Detalles_Ubicacion VARCHAR(70),
    Tipo_Almacenamiento VARCHAR(70),
    Capacidad INT
);

-- Tabla: Inventario
CREATE TABLE inventario (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Inventario VARCHAR(70),
    Caducidad DATE,
    Numero_Lote VARCHAR(70),
    Estado_Stock VARCHAR(70)
);

-- Tabla: Ingreso
CREATE TABLE ingreso (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Precio INT,
    Marca VARCHAR(70),
    Fecha_Ingreso DATE,
    Metodo_Adquisicion VARCHAR(70)
);

-- Tabla: Articulos
CREATE TABLE articulos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Prestamos INT,
    ID_Solicitantes INT,
    ID_Ubicacion INT,
    ID_Inventario INT,
    ID_Ingreso INT,
    Articulo VARCHAR(70),
    Descripcion VARCHAR(70),
    Categoria VARCHAR(70),
    Estado VARCHAR(70),
    Cantidad INT,
    Fecha_Adquisicion DATE,
    Proveedor VARCHAR(70),
    --Numero_Serie VARCHAR(70),
    Observaciones VARCHAR(70),
    FOREIGN KEY (ID_Prestamos) REFERENCES prestamos(ID),
    FOREIGN KEY (ID_Solicitantes) REFERENCES solicitantes(ID),
    FOREIGN KEY (ID_Ubicacion) REFERENCES ubicacion(ID),
    FOREIGN KEY (ID_Inventario) REFERENCES inventario(ID),
    FOREIGN KEY (ID_Ingreso) REFERENCES ingreso(ID) 
);


--Registros--
----------------------------ARTICULO 1----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-10-14",  
        "2023-11-20",  
        "Presenta algunos cambios."
    ); 
    SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Alfredo Salazar",
        "Mexicano",  
        "Mariano Matamoros #23, Tijuana",  
        "5568710231", 
        "asal@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 2",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-08-15",
       "Lote456", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        35,
        "Chanpito",
        "2023-10-15",
        "Proveedor local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Teléfono",
        "Smartphone Samsung",
        "Electrónica",
        "Nuevo",
        2,
        "2023-10-15",
        "Proveedor 1",
        "En caja, color negro",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 2----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-10-15",  
        "2023-11-21",  
        "Sin observaciones."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Maria Hernandez",
        "Colombiana",  
        "Carrera 45 #67-89, Bogotá",  
        "3115678901", 
        "mhernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 3",
        "Almacén",
        800 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-09-20",
       "Lote789", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        45,
        "TechCorp",
        "2023-10-16",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Laptop",
        "Dell Inspiron",
        "Electrónica",
        "Nuevo",
        1,
        "2023-10-16",
        "Proveedor 2",
        "Incluye accesorios",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 3----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-10-17",  
        NULL,  
        "En espera de aprobación"  
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Juan Martinez",
        "Español",  
        "Calle Mayor #123, Madrid",  
        "677890123", 
        "jmartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 1",
        "Almacén",
        300 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-11-05",
       "Lote123", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        50,
        "GadgetWorld",
        "2023-10-18",
        "Compra directa"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara",
        "Canon EOS 80D",
        "Fotografía",
        "Nuevo",
        1,
        "2023-10-18",
        "Proveedor 3",
        "Incluye estuche",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 4----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-10-19",  
        "2023-11-25",  
        "Todo en orden."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Emily Johnson",
        "Estadounidense",  
        "123 Main St, New York",  
        "5556789012", 
        "ejohnson@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 4",
        "Almacén",
        700 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-10-30",
       "Lote789", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        65,
        "ElectroTech",
        "2023-10-20",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "iPad Pro",
        "Electrónica",
        "Nuevo",
        3,
        "2023-10-20",
        "Proveedor 4",
        "Pantalla retina",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 5----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-10-21",  
        NULL,  
        "En espera de confirmación."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Sophia Rodriguez",
        "Mexicana",  
        "Av. Reforma #456, Ciudad de México",  
        "5543210987", 
        "srodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 5",
        "Almacén",
        400 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-11-10",
       "Lote987", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        40,
        "GizmoStore",
        "2023-10-22",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Impresora",
        "HP LaserJet Pro",
        "Oficina",
        "Nuevo",
        1,
        "2023-10-22",
        "Proveedor 5",
        "Impresión a doble cara",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 6----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-10-23",  
        "2023-11-28",  
        "Listo para su entrega."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Carlos Fernandez",
        "Argentino",  
        "Av. Libertador #789, Buenos Aires",  
        "9112345678", 
        "cfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 6",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-11-15",
       "Lote345", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        55,
        "ElectroMax",
        "2023-10-24",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Monitor",
        "LG UltraWide",
        "Informática",
        "Nuevo",
        1,
        "2023-10-24",
        "Proveedor 6",
        "Resolución 4K",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 7----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-10-25",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Isabella Lopez",
        "Colombiana",  
        "Calle 10 #456, Medellín",  
        "3225678901", 
        "ilopez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 7",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-01",
       "Lote567", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        60,
        "TechZone",
        "2023-10-26",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Teclado",
        "Logitech G Pro X",
        "Informática",
        "Nuevo",
        1,
        "2023-10-26",
        "Proveedor 7",
        "Switches intercambiables",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


---------------------ARTICULO 8----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-10-27",  
        "2023-12-02",  
        "Listo para su uso." 
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Daniel Silva",
        "Brasileño",  
        "Rua Principal #123, Sao Paulo",  
        "5512345678", 
        "dsilva@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 8",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-11-20",
       "Lote890", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "ElectroMaster",
        "2023-10-28",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Altavoces",
        "Bose SoundLink Revolve",
        "Audio",
        "Nuevo",
        2,
        "2023-10-28",
        "Proveedor 8",
        "Sonido envolvente",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 9----------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-10-29",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Elena Gonzalez",
        "Española",  
        "Calle Gran Vía #789, Madrid",  
        "633456789", 
        "egonzalez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 9",
        "Almacén",
        400 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-05",
       "Lote456", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        50,
        "GadgetEmporium",
        "2023-10-30",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Ratón",
        "Logitech MX Master 3",
        "Informática",
        "Nuevo",
        1,
        "2023-10-30",
        "Proveedor 9",
        "Conexión Bluetooth",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 10---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-01",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Luis Hernandez",
        "Mexicano",  
        "Av. Juarez #345, Monterrey",  
        "8112345678", 
        "lhernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 10",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-11-15",
       "Lote567", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        60,
        "ElectroMax",
        "2023-11-02",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Micrófono",
        "Blue Yeti",
        "Audio",
        "Nuevo",
        1,
        "2023-11-02",
        "Proveedor 10",
        "Conexión USB",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 11---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-03",  
        "2023-12-08",  
        "Listo para su entrega."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Marta Fernandez",
        "Española",  
        "Calle Mayor #567, Barcelona",  
        "6338901234", 
        "mfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 11",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-11-25",
       "Lote678", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        70,
        "TechWorld",
        "2023-11-04",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara de seguridad",
        "Arlo Pro 3",
        "Seguridad",
        "Nuevo",
        2,
        "2023-11-04",
        "Proveedor 11",
        "Resistente al agua",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 12---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-05",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Antonio Martinez",
        "Mexicano",  
        "Av. Reforma #789, Ciudad de México",  
        "5543210908", 
        "amartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 12",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-11-20",
       "Lote123", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        45,
        "GizmoTech",
        "2023-11-06",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID(); 

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smartwatch",
        "Apple Watch Series 6",
        "Electrónica",
        "Nuevo",
        1,
        "2023-11-06",
        "Proveedor 12",
        "Monitor de oxígeno en sangre",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 13---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-07",  
        "2023-12-12",  
        "Listo para su entrega." 
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Emma Smith",
        "Estadounidense",  
        "123 Main St, New York",  
        "5551234567", 
        "esmith@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 13",
        "Almacén",
        700 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-11-30",
       "Lote890", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        80,
        "ElectroGadgets",
        "2023-11-08",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Bocinas Bluetooth",
        "JBL Flip 5",
        "Audio",
        "Nuevo",
        2,
        "2023-11-08",
        "Proveedor 13",
        "Resistente al agua",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 14---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-09",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Olivia Brown",
        "Canadiense",  
        "Maple St #789, Toronto",  
        "4163456789", 
        "obrown@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 14",
        "Almacén",
        350 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-11-25",
       "Lote234", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        55,
        "GadgetHaven",
        "2023-11-10",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Drone",
        "DJI Mavic Air 2",
        "Electrónica",
        "Nuevo",
        1,
        "2023-11-10",
        "Proveedor 14",
        "Cámara 4K",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 15---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-11",  
        "2023-12-16",  
        "Presenta algunas mejoras."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Lucas Rodriguez",
        "Argentino",  
        "Avenida de Mayo #123, Buenos Aires",  
        "9118765432", 
        "lrodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 15",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-05",
       "Lote567", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        70,
        "ElectroTech",
        "2023-11-12",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "iPad Pro",
        "Electrónica",
        "Nuevo",
        1,
        "2023-11-12",
        "Proveedor 15",
        "Pantalla Liquid Retina",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 16---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-13",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Sophie Williams",
        "Inglesa",  
        "Baker Street #789, London",  
        "7712345678", 
        "swilliams@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 16",
        "Almacén",
        400 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-10",
       "Lote789", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "TechEmpire",
        "2023-11-14",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Laptop",
        "Dell XPS 13",
        "Informática",
        "Nuevo",
        1,
        "2023-11-14",
        "Proveedor 16",
        "Procesador Intel Core i7",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 17---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-15",  
        "2023-12-20",  
        "En perfecto estado." 
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Mateo Garcia",
        "Colombiano",  
        "Carrera 15 #567, Bogotá",  
        "3118765432", 
        "mgarcia@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 17",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-01",
       "Lote234", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        80,
        "ElectroMega",
        "2023-11-16",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Impresora 3D",
        "Creality Ender 3",
        "Oficina",
        "Nuevo",
        1,
        "2023-11-16",
        "Proveedor 17",
        "Área de impresión 220x220x250mm",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 18---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-17",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Emma Watson",
        "Británica",  
        "221B Baker Street, London",  
        "7723456789", 
        "ewatson@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 18",
        "Almacén",
        400 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-05",
       "Lote567", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        50,
        "GadgetStore",
        "2023-11-18",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Gafas de Realidad Virtual",
        "Oculus Quest 2",
        "Electrónica",
        "Nuevo",
        1,
        "2023-11-18",
        "Proveedor 18",
        "Resolución 3664x1920 por ojo",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 19---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-19",  
        "2023-12-24",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Nicolas Kim",
        "Surcoreano",  
        "Seoul Street #789, Seoul",  
        "1023456789", 
        "nkim@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 19",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-01",
       "Lote890", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        90,
        "TechWorld",
        "2023-11-20",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Robot Aspiradora",
        "iRobot Roomba i7",
        "Hogar",
        "Nuevo",
        1,
        "2023-11-20",
        "Proveedor 19",
        "Sistema de limpieza autovaciable",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 20---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-21",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Sofia Lopez",
        "Mexicana",  
        "Insurgentes Sur #789, Ciudad de México",  
        "5512345678", 
        "slopez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 20",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-10",
       "Lote123", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        65,
        "GizmoTech",
        "2023-11-22",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Teclado Mecánico",
        "Logitech G Pro X",
        "Informática",
        "Nuevo",
        1,
        "2023-11-22",
        "Proveedor 20",
        "Interruptores GX Blue",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    ); 


----------------------------ARTICULO 21---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-11-25",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ana Rodriguez",
        "Española",  
        "Calle Mayor #456, Madrid",  
        "612345678", 
        "arodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 21",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-05",
       "Lote789", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        40,
        "TechGizmo",
        "2023-11-26",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "iPad Air",
        "Electrónica",
        "Nuevo",
        1,
        "2023-11-26",
        "Proveedor 21",
        "Pantalla Retina de 10.9 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 22---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-11-28",  
        "2023-12-15",  
        "En buen estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Carlos Fernandez",
        "Mexicano",  
        "Reforma #789, Ciudad de México",  
        "5543219876", 
        "cfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 22",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-10",
       "Lote222", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        55,
        "GadgetWorld",
        "2023-11-29",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara DSLR",
        "Canon EOS 90D",
        "Fotografía",
        "Nuevo",
        1,
        "2023-11-29",
        "Proveedor 22",
        "Sensor APS-C de 32.5 megapíxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 23---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-12-02",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Elena Martínez",
        "Española",  
        "Gran Vía #456, Barcelona",  
        "623456789", 
        "emartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 23",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-20",
       "Lote333", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        45,
        "ElectroGizmo",
        "2023-12-03",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smartwatch",
        "Samsung Galaxy Watch 4",
        "Electrónica",
        "Nuevo",
        1,
        "2023-12-03",
        "Proveedor 23",
        "Monitor de ritmo cardíaco y ECG",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 24---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-12-05",  
        "2023-12-20",  
        "En buen estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Julia Fernandez",
        "Mexicana",  
        "Reforma #567, Ciudad de México",  
        "5543211234", 
        "jfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 24",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-15",
       "Lote444", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        60,
        "TechZone",
        "2023-12-06",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Altavoces Bluetooth",
        "JBL Charge 5",
        "Audio",
        "Nuevo",
        2,
        "2023-12-06",
        "Proveedor 24",
        "Batería de 7500 mAh",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 25---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-12-08",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Mario Perez",
        "Español",  
        "Calle Real #789, Madrid",  
        "633456789", 
        "mperez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 25",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-25",
       "Lote555", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        70,
        "ElectroMax",
        "2023-12-09",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara de Seguridad",
        "Arlo Pro 4",
        "Seguridad",
        "Nuevo",
        3,
        "2023-12-09",
        "Proveedor 25",
        "Resolución 2K con visión nocturna",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 26---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-12-12",  
        "2023-12-27",  
        "Listo para su uso."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Luisa Rodriguez",
        "Mexicana",  
        "Av. Juárez #456, Guadalajara",  
        "5511122333", 
        "lrodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 26",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-20",
       "Lote666", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        80,
        "TechUniverse",
        "2023-12-13",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "Apple iPad Air 4",
        "Electrónica",
        "Nuevo",
        1,
        "2023-12-13",
        "Proveedor 26",
        "Pantalla Retina de 10.9 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 27---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-12-15",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Gabriel Martinez",
        "Argentino",  
        "Avenida de Mayo #789, Buenos Aires",  
        "5412345678", 
        "gmartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 27",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-30",
       "Lote777", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        90,
        "ElectroTech",
        "2023-12-16",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Drone",
        "DJI Mavic Air 2",
        "Tecnología",
        "Nuevo",
        1,
        "2023-12-16",
        "Proveedor 27",
        "Cámara 4K y autonomía de vuelo",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 28---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-12-18",  
        "2023-12-28",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Elena Sanchez",
        "Española",  
        "Gran Vía #567, Madrid",  
        "633987654", 
        "esanchez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 28",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-25",
       "Lote888", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "TechCity",
        "2023-12-19",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smartwatch",
        "Apple Watch Series 7",
        "Electrónica",
        "Nuevo",
        1,
        "2023-12-19",
        "Proveedor 28",
        "Pantalla Retina siempre activa",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 29---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2023-12-21",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Carlos Mendoza",
        "Mexicano",  
        "Insurgentes Norte #789, Ciudad de México",  
        "5511122334", 
        "cmendoza@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 29",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2023-12-30",
       "Lote999", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        85,
        "ElectroNation",
        "2023-12-22",
        "Compra internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Monitor Gaming",
        "ASUS ROG Swift PG279Q",
        "Informática",
        "Nuevo",
        1,
        "2023-12-22",
        "Proveedor 29",
        "27 pulgadas, 1440p, 165Hz",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 30---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2023-12-24",  
        "2023-12-29",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ana Maria",
        "Mexicana",  
        "Av. Reforma #567, Puebla",  
        "5522345678", 
        "amaria@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 30",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2023-12-28",
       "Lote1010", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        95,
        "TechTrend",
        "2023-12-25",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara DSLR",
        "Canon EOS 90D",
        "Fotografía",
        "Nuevo",
        1,
        "2023-12-25",
        "Proveedor 30",
        "Sensor CMOS de 32.5 megapíxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 31---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-01-05",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Luis Martinez",
        "Mexicano",  
        "Av. Juarez #567, Guadalajara",  
        "5533334444", 
        "lmartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 31",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-01-10",
       "Lote1111", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        80,
        "GadgetHub",
        "2024-01-06",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Altavoces Bluetooth",
        "JBL Flip 5",
        "Electrónica",
        "Nuevo",
        2,
        "2024-01-06",
        "Proveedor 31",
        "Resistente al agua",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 32---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-01-08",  
        "2024-01-15",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Mariana Rodriguez",
        "Mexicana",  
        "Calle 5 #567, Monterrey",  
        "5512345678", 
        "mrodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 32",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-01-12",
       "Lote2222", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        95,
        "TechStore",
        "2024-01-09",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "Apple iPad Air",
        "Electrónica",
        "Nuevo",
        1,
        "2024-01-09",
        "Proveedor 32",
        "Pantalla Liquid Retina de 10.9 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 33---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-01-11",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ricardo Fernandez",
        "Mexicano",  
        "Reforma #567, Ciudad de México",  
        "5544445555", 
        "rfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 33",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-01-18",
       "Lote3333", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        70,
        "GizmoNation",
        "2024-01-12",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Impresora Fotográfica",
        "Epson SureColor P800",
        "Fotografía",
        "Nuevo",
        1,
        "2024-01-12",
        "Proveedor 33",
        "Impresiones de hasta 17 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 34---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-01-14",  
        "2024-02-20",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ana Morales",
        "Mexicana",  
        "Av. Insurgentes #567, Puebla",  
        "5533334444", 
        "amorales@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 34",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-01-20",
       "Lote4444", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        120,
        "TechBlast",
        "2024-01-15",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smartwatch",
        "Apple Watch Series 7",
        "Electrónica",
        "Nuevo",
        1,
        "2024-01-15",
        "Proveedor 34",
        "Pantalla Retina siempre activa",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 35---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-01-17",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Carolina Herrera",
        "Mexicana",  
        "Reforma #789, Ciudad de México",  
        "5544445555", 
        "cherrera@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 35",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-01-24",
       "Lote5555", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        90,
        "GizmoTech",
        "2024-01-18",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Auriculares Inalámbricos",
        "Sony WH-1000XM4",
        "Electrónica",
        "Nuevo",
        1,
        "2024-01-18",
        "Proveedor 35",
        "Cancelación de ruido",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 36---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-02-05",  
        "2024-02-20",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Alejandro Gomez",
        "Mexicano",  
        "Av. Revolucion #567, Tijuana",  
        "5566778899", 
        "agomez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 36",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-02-10",
       "Lote6666", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        40,
        "TechCity",
        "2024-02-06",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara DSLR",
        "Canon EOS 90D",
        "Fotografía",
        "Nuevo",
        1,
        "2024-02-06",
        "Proveedor 36",
        "Sensor CMOS de 32.5 megapíxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 37---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-02-08",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Isabella Martinez",
        "Mexicana",  
        "Av. Juarez #567, Monterrey",  
        "5544332211", 
        "imartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 37",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-02-15",
       "Lote7777", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        85,
        "ElectroMega",
        "2024-02-09",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Aspiradora Robot",
        "Ecovacs Deebot N8 Pro",
        "Hogar",
        "Nuevo",
        1,
        "2024-02-09",
        "Proveedor 37",
        "Limpieza sistemática con tecnología láser",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 38---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-02-11",  
        "2024-02-25",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Lucas Hernandez",
        "Mexicano",  
        "Calle 5 #567, Ciudad de México",  
        "5533221122", 
        "lhernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 38",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-02-18",
       "Lote8888", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        110,
        "GadgetBlast",
        "2024-02-12",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Drone",
        "DJI Mavic Air 2",
        "Electrónica",
        "Nuevo",
        1,
        "2024-02-12",
        "Proveedor 38",
        "Cámara de 48 megapíxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 39---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-02-14",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Javier Ramirez",
        "Mexicano",  
        "Paseo de la Reforma #567, Ciudad de México",  
        "5511223344", 
        "jramirez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 39",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-02-20",
       "Lote9999", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "TechEmpire",
        "2024-02-15",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tableta Gráfica",
        "Wacom Intuos Pro",
        "Informática",
        "Nuevo",
        1,
        "2024-02-15",
        "Proveedor 39",
        "Niveles de presión 8192",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 40---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-02-17",  
        "2024-03-03",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Elena Fernandez",
        "Mexicana",  
        "Blvd. Miguel de la Madrid #567, Guadalajara",  
        "5555444433", 
        "efernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 40",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-02-25",
       "Lote1010", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        95,
        "ElectroMega",
        "2024-02-18",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Altavoces Bluetooth",
        "JBL Charge 5",
        "Electrónica",
        "Nuevo",
        2,
        "2024-02-18",
        "Proveedor 40",
        "Batería recargable",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 41---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-03-02",  
        "2024-03-17",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Carlos Rodriguez",
        "Mexicano",  
        "Av. Hidalgo #567, Puebla",  
        "5566332211", 
        "crodriguez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 41",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-03-10",
       "Lote1111", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        55,
        "TechBlast",
        "2024-03-03",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smartwatch",
        "Apple Watch Series 7",
        "Electrónica",
        "Nuevo",
        1,
        "2024-03-03",
        "Proveedor 41",
        "Pantalla Retina siempre activa",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 42---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-03-05",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ana Torres",
        "Mexicana",  
        "Calle 8 #567, Guanajuato",  
        "5544331122", 
        "atorres@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 42",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-03-15",
       "Lote1212", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "ElectroMega",
        "2024-03-06",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cascos Inalámbricos",
        "Sony WH-1000XM4",
        "Electrónica",
        "Nuevo",
        1,
        "2024-03-06",
        "Proveedor 42",
        "Cancelación de ruido líder en la industria",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 43---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-03-08",  
        "2024-03-23",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "María Gonzalez",
        "Mexicana",  
        "Carrera 12 #567, Monterrey",  
        "5566332211", 
        "mgonzalez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 43",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-03-18",
       "Lote1313", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO Ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        90,
        "TechWorld",
        "2024-03-09",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Impresora Multifunción",
        "HP OfficeJet Pro 9015",
        "Oficina",
        "Nuevo",
        1,
        "2024-03-09",
        "Proveedor 43",
        "Impresión a doble cara automática",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 44---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-03-11",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Luisa Martinez",
        "Mexicana",  
        "Av. Juarez #567, Ciudad de México",  
        "5544332211", 
        "lmartinez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 44",
        "Almacén",
        400 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-03-25",
       "Lote1414", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        65,
        "GizmoTech",
        "2024-03-12",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Cámara DSLR",
        "Canon EOS 90D",
        "Fotografía",
        "Nuevo",
        1,
        "2024-03-12",
        "Proveedor 44",
        "Sensor CMOS de 32.5 megapíxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 45---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-03-14",  
        "2024-03-29",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Alejandro Castro",
        "Mexicano",  
        "Calle Reforma #567, Oaxaca",  
        "5566332211", 
        "acastro@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 45",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-03-20",
       "Lote1515", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        80,
        "ElectroMega",
        "2024-03-15",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Teclado Inalámbrico",
        "Logitech MX Keys",
        "Informática",
        "Nuevo",
        1,
        "2024-03-15",
        "Proveedor 45",
        "Retroiluminación inteligente",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );


----------------------------ARTICULO 46---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-04-01",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Laura Mendoza",
        "Mexicana",  
        "Calle 20 #567, Veracruz",  
        "5544332211", 
        "lmendoza@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 46",
        "Almacén",
        450 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-04-10",
       "Lote1616", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        50,
        "GadgetStore",
        "2024-04-02",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Tablet",
        "Samsung Galaxy Tab S7",
        "Electrónica",
        "Nuevo",
        1,
        "2024-04-02",
        "Proveedor 46",
        "Pantalla Super AMOLED de 11 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 47---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-04-04",  
        "2024-04-19",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Juan Herrera",
        "Mexicano",  
        "Calle 15 #567, Guadalajara",  
        "5566332211", 
        "jherrera@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 47",
        "Almacén",
        600 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-04-15",
       "Lote1717", 
       "Medio"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        75,
        "ElectroMega",
        "2024-04-05",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Auriculares Bluetooth",
        "Bose QuietComfort 35 II",
        "Electrónica",
        "Nuevo",
        1,
        "2024-04-05",
        "Proveedor 47",
        "Cancelación de ruido ajustable",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 48---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-04-07",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ricardo Fernandez",
        "Mexicano",  
        "Calle 25 #567, Monterrey",  
        "5544332211", 
        "rfernandez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 48",
        "Almacén",
        550 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-04-20",
       "Lote1818", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        90,
        "TechWorld",
        "2024-04-08",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Smart TV",
        "LG OLED C1",
        "Electrónica",
        "Nuevo",
        1,
        "2024-04-08",
        "Proveedor 48",
        "Pantalla OLED de 65 pulgadas",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 49---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Aprobado",
        "2024-04-10",  
        "2024-04-25",  
        "En perfecto estado."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Ana Torres",
        "Mexicana",  
        "Av. Reforma #567, Puebla",  
        "5566332211", 
        "atorres@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 49",
        "Almacén",
        700 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Externo",
       "2024-04-15",
       "Lote1919", 
       "Bajo"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        55,
        "GadgetStore",
        "2024-04-11",
        "Compra local"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Aspiradora Robot",
        "iRobot Roomba s9+",
        "Hogar",
        "Nuevo",
        1,
        "2024-04-11",
        "Proveedor 49",
        "Sistema de limpieza avanzado",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );

----------------------------ARTICULO 50---------------------------------------
INSERT INTO prestamos (Estado_Prestamo,Fecha_Prestamo,Fecha_Devolucion,Observaciones_Adicionales) VALUES
    (
        "Pendiente",
        "2024-04-13",  
        NULL,  
        "Esperando confirmación de disponibilidad."
    ); 
SET @ID_Prestamos = LAST_INSERT_ID();

INSERT INTO solicitantes (Nombre,Otros_Datos,Direccion,Numero_Contacto,Correo_Electronico) VALUES
    (
        "Gabriel Ramirez",
        "Mexicano",  
        "Calle 30 #567, Querétaro",  
        "5544332211", 
        "gramirez@gmail.com" 
    ); 
SET @ID_Solicitantes = LAST_INSERT_ID();

INSERT INTO ubicacion (Detalles_Ubicacion,Tipo_Almacenamiento,Capacidad) VALUES
    (
        "Ubicación 50",
        "Almacén",
        500 
    ); 
SET @ID_Ubicacion = LAST_INSERT_ID();

INSERT INTO inventario (Tipo_Inventario,Caducidad,Numero_Lote,Estado_Stock) VALUES
    (
       "Interno",
       "2024-04-25",
       "Lote2020", 
       "Alto"
    ); 
SET @ID_Inventario = LAST_INSERT_ID();

INSERT INTO ingreso (Precio,Marca,Fecha_Ingreso,Metodo_Adquisicion) VALUES
    (
        70,
        "TechEmpire",
        "2024-04-14",
        "Importación internacional"
    ); 
SET @ID_Ingreso = LAST_INSERT_ID();

INSERT INTO articulos (Articulo,Descripcion,Categoria,Estado,Cantidad,Fecha_Adquisicion,
Proveedor,Observaciones,ID_Prestamos, ID_Solicitantes, ID_Ubicacion, 
ID_Inventario, ID_Ingreso) VALUES
    (
        "Monitor Curvo",
        "Samsung Odyssey G7",
        "Informática",
        "Nuevo",
        1,
        "2024-04-14",
        "Proveedor 50",
        "Resolución QHD de 2560 x 1440 píxeles",
        @ID_Prestamos,
        @ID_Solicitantes,
        @ID_Ubicacion,
        @ID_Inventario,
        @ID_Ingreso
    );