--PRAGMA foreign_keys = ON;

-- =================================================================
-- NOTA: Asumo que ya ejecutaste el script de las tablas
-- 'Estados_Prestamo' y 'Estados_Multa' que te pasé antes.
-- Si no lo hiciste, este script fallará.
-- =================================================================


-- -----------------------------
-- 5 AUTORES
-- -----------------------------
INSERT INTO Autores (Nombre_Completo) VALUES
('Gabriel García Márquez'),
('J.K. Rowling'),
('George R.R. Martin'),
('Stephen King'),
('Haruki Murakami');

-- -----------------------------
-- 10 SOCIOS (para que haya variedad)
-- -----------------------------
INSERT INTO Socios (Nombre, Apellido, Email, Estado) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', 'Activo'),
('María', 'González', 'maria.gonzalez@example.com', 'Activo'),
('Carlos', 'López', 'carlos.lopez@example.com', 'Activo'),
('Ana', 'Martínez', 'ana.martinez@example.com', 'Suspendido'),
('Luis', 'Fernández', 'luis.fernandez@example.com', 'Activo'),
('Laura', 'Rodríguez', 'laura.rodriguez@example.com', 'Activo'),
('Pedro', 'Sánchez', 'pedro.sanchez@example.com', 'Activo'),
('Sofía', 'Gómez', 'sofia.gomez@example.com', 'Activo'),
('Diego', 'Torres', 'diego.torres@example.com', 'Activo'),
('Elena', 'Ramírez', 'elena.ramirez@example.com', 'Activo');

-- -----------------------------
-- 20 LIBROS
-- -----------------------------
INSERT INTO Libros (ISBN, Titulo, Genero, Ubicacion_Fisica, Cantidad_Total_Ejemplares) VALUES
('978-0307350444', 'Cien Años de Soledad', 'Realismo Mágico', 'A-101', 5),
('978-0743273565', 'El Amor en los Tiempos del Cólera', 'Realismo Mágico', 'A-102', 3),
('978-8478884452', 'Harry Potter y la Piedra Filosofal', 'Fantasía', 'B-201', 10),
('978-8478884957', 'Harry Potter y la Cámara Secreta', 'Fantasía', 'B-202', 8),
('978-0553103540', 'Juego de Tronos', 'Fantasía Épica', 'B-301', 12),
('978-0553108033', 'Choque de Reyes', 'Fantasía Épica', 'B-302', 11),
('978-0553106633', 'Tormenta de Espadas', 'Fantasía Épica', 'B-303', 10),
('978-0670813025', 'It (Eso)', 'Terror', 'C-101', 7),
('978-0385121675', 'El Resplandor', 'Terror', 'C-102', 6),
('978-0670817641', 'Misery', 'Terror', 'C-103', 5),
('978-8483835900', '1Q84', 'Ciencia Ficción', 'D-101', 4),
('978-8483837928', 'Tokio Blues (Norwegian Wood)', 'Drama', 'D-102', 6),
('978-8483836334', 'Kafka en la Orilla', 'Realismo Mágico', 'D-103', 5),
('978-9875806433', 'Sapiens: De animales a dioses', 'No Ficción', 'E-101', 8),
('978-0451524935', '1984', 'Ciencia Ficción', 'D-201', 10),
('978-0321765723', 'Clean Code', 'Programación', 'F-101', 15),
('978-0132350884', 'The Pragmatic Programmer', 'Programación', 'F-102', 12),
('978-0441172719', 'Dune', 'Ciencia Ficción', 'D-202', 9),
('978-0345391803', 'El Hobbit', 'Fantasía', 'B-101', 10),
('978-0553381689', 'Festín de Cuervos', 'Fantasía Épica', 'B-304', 10);

-- -----------------------------
-- Relaciones LIBRO-AUTOR
-- -----------------------------
INSERT INTO Libro_Autor (ID_Libro, ID_Autor) VALUES
(1, 1),  -- Cien Años -> GGM
(2, 1),  -- El Amor -> GGM
(3, 2),  -- HP 1 -> JKR
(4, 2),  -- HP 2 -> JKR
(5, 3),  -- GoT 1 -> GRRM
(6, 3),  -- GoT 2 -> GRRM
(7, 3),  -- GoT 3 -> GRRM
(20, 3), -- Festín -> GRRM
(8, 4),  -- It -> SK
(9, 4),  -- El Resplandor -> SK
(10, 4), -- Misery -> SK
(11, 5), -- 1Q84 -> HM
(12, 5), -- Tokio Blues -> HM
(13, 5); -- Kafka -> HM

-- -----------------------------
-- 50 PRÉSTAMOS
-- -----------------------------

-- (Asumiendo ID_Estado_Prestamo: 1='Activo', 2='Devuelto', 3='Vencido')

-- 20 Préstamos DEVUELTOS (Estado 2)
INSERT INTO Prestamos (ID_Socio, ID_Libro, ID_Estado_Prestamo, Fecha_Prestamo, Fecha_Devolucion_Estimada, Fecha_Devolucion_Real) VALUES
(1, 3, 2, '2025-08-01', '2025-08-15', '2025-08-14'),
(2, 5, 2, '2025-08-02', '2025-08-16', '2025-08-16'),
(3, 8, 2, '2025-08-03', '2025-08-17', '2025-08-18'), -- Devuelto con 1 día de retraso
(1, 11, 2, '2025-08-05', '2025-08-20', '2025-08-19'),
(5, 15, 2, '2025-08-05', '2025-08-20', '2025-08-20'),
(6, 16, 2, '2025-08-06', '2025-08-21', '2025-08-20'),
(7, 18, 2, '2025-08-07', '2025-08-22', '2025-08-25'), -- Devuelto con 3 días de retraso
(8, 1, 2, '2025-08-08', '2025-08-23', '2025-08-22'),
(9, 2, 2, '2025-08-10', '2025-08-25', '2025-08-25'),
(10, 4, 2, '2025-08-11', '2025-08-26', '2025-08-26'),
(1, 6, 2, '2025-09-01', '2025-09-15', '2025-09-14'),
(2, 7, 2, '2025-09-02', '2025-09-16', '2025-09-16'),
(3, 9, 2, '2025-09-03', '2025-09-17', '2025-09-18'), -- Devuelto con 1 día de retraso
(5, 10, 2, '2025-09-05', '2025-09-20', '2025-09-19'),
(6, 12, 2, '2025-09-05', '2025-09-20', '2025-09-20'),
(7, 13, 2, '2025-09-06', '2025-09-21', '2025-09-20'),
(8, 14, 2, '2025-09-07', '2025-09-22', '2025-09-25'), -- Devuelto con 3 días de retraso
(9, 17, 2, '2025-09-08', '2025-09-23', '2025-09-22'),
(10, 19, 2, '2025-09-10', '2025-09-25', '2025-09-25'),
(1, 20, 2, '2025-09-11', '2025-09-26', '2025-09-26');

-- 20 Préstamos ACTIVOS (Estado 1) (Fechas actuales - Oct 2025)
INSERT INTO Prestamos (ID_Socio, ID_Libro, ID_Estado_Prestamo, Fecha_Prestamo, Fecha_Devolucion_Estimada, Fecha_Devolucion_Real) VALUES
(2, 1, 1, '2025-10-15', '2025-10-30', NULL),
(3, 2, 1, '2025-10-15', '2025-10-30', NULL),
(5, 3, 1, '2025-10-16', '2025-10-31', NULL),
(6, 4, 1, '2025-10-16', '2025-10-31', NULL),
(7, 5, 1, '2025-10-17', '2025-11-01', NULL),
(8, 6, 1, '2025-10-17', '2025-11-01', NULL),
(9, 7, 1, '2025-10-20', '2025-11-04', NULL),
(10, 8, 1, '2025-10-20', '2025-11-04', NULL),
(1, 9, 1, '2025-10-21', '2025-11-05', NULL),
(2, 10, 1, '2025-10-21', '2025-11-05', NULL),
(3, 11, 1, '2025-10-22', '2025-11-06', NULL),
(5, 12, 1, '2025-10-22', '2025-11-06', NULL),
(6, 13, 1, '2025-10-23', '2025-11-07', NULL),
(7, 14, 1, '2025-10-24', '2025-11-08', NULL),
(8, 15, 1, '2025-10-25', '2025-11-09', NULL),
(9, 16, 1, '2025-10-27', '2025-11-11', NULL),
(10, 17, 1, '2025-10-27', '2025-11-11', NULL),
(1, 18, 1, '2025-10-28', '2025-11-12', NULL),
(2, 19, 1, '2025-10-28', '2025-11-12', NULL),
(3, 20, 1, '2025-10-28', '2025-11-12', NULL);

-- 10 Préstamos VENCIDOS (Estado 3) (Fecha estimada ya pasó)
-- Estos generarán MULTAS
INSERT INTO Prestamos (ID_Socio, ID_Libro, ID_Estado_Prestamo, Fecha_Prestamo, Fecha_Devolucion_Estimada, Fecha_Devolucion_Real) VALUES
(4, 1, 3, '2025-09-01', '2025-09-15', NULL), -- Socio Suspendido
(5, 2, 3, '2025-09-01', '2025-09-15', NULL),
(6, 3, 3, '2025-09-02', '2025-09-16', NULL),
(7, 4, 3, '2025-09-02', '2025-09-16', NULL),
(8, 5, 3, '2025-09-03', '2025-09-17', NULL),
(9, 6, 3, '2025-09-03', '2025-09-17', NULL),
(10, 7, 3, '2025-09-04', '2025-09-18', NULL),
(1, 8, 3, '2025-09-04', '2025-09-18', NULL),
(2, 9, 3, '2025-09-05', '2025-09-19', NULL),
(3, 10, 3, '2025-09-05', '2025-09-19', NULL);

-- -----------------------------
-- 10 MULTAS (para los 10 préstamos vencidos)
-- -----------------------------

-- (Asumiendo ID_Estado_Multa: 1='Pendiente', 2='Pagada')
-- (Asumiendo que los ID_Prestamo vencidos son del 41 al 50)
INSERT INTO Multas (ID_Prestamo, ID_Estado_Multa, Monto, Fecha_Generacion) VALUES
(41, 1, 50.00, '2025-09-16'), -- Pendiente
(42, 1, 50.00, '2025-09-16'), -- Pendiente
(43, 1, 45.00, '2025-09-17'), -- Pendiente
(44, 1, 45.00, '2025-09-17'), -- Pendiente
(45, 1, 40.00, '2025-09-18'), -- Pendiente
(46, 2, 40.00, '2025-09-18'), -- Pagada
(47, 2, 35.00, '2025-09-19'), -- Pagada
(48, 2, 35.00, '2025-09-19'), -- Pagada
(49, 2, 30.00, '2025-09-20'), -- Pagada
(50, 2, 30.00, '2025-09-20'); -- Pagada