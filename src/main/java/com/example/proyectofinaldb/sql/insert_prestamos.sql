INSERT INTO prestamos (estado_prestamo, fecha_prestamo, fecha_devolucion, observaciones_adicionales, id_solicitante, id_articulo)
VALUES
    ('En proceso', '2023-07-15', '2023-07-25', 'Ninguna', 1, 1),
    ('Devuelto', '2023-08-03', '2023-08-20', 'Sin daños', 2, 3),
    ('En proceso', '2023-09-10', NULL, 'Solicitante nuevo', 3, 2),
    ('Devuelto', '2023-06-28', '2023-07-10', 'Pequeños arañazos', 1, 4),
    ('En proceso', '2023-10-05', NULL, 'Sin comentarios', 4, 5);

SOURCE insert_usuarios.sql;