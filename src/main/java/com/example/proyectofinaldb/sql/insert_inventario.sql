INSERT INTO inventario (tipo_inventario, fecha_caducidad, numero_lote, estado_stock)
VALUES
    ('Productos de limpieza', '2024-06-30', 'Lote-123', 'Disponible'),
    ('Medicamentos', '2023-12-15', 'Lote-456', 'Agotado'),
    ('Herramientas', NULL, 'Lote-789', 'Disponible'),
    ('Electrodomésticos', '2025-02-28', 'Lote-101', 'Disponible'),
    ('Ropa', '2024-09-20', 'Lote-202', 'Disponible'),
    ('Computacion', '2024-09-20', 'Lote-201', 'Disponible');

SOURCE insert_solicitantes.sql;