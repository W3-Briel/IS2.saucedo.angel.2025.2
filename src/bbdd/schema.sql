-- -----------------------------
-- Tablas sin dependencias
-- -----------------------------

CREATE TABLE Socios (
    ID_Socio INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Apellido TEXT NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    Estado TEXT NOT NULL DEFAULT 'Activo'
);

CREATE TABLE Autores (
    ID_Autor INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre_Completo TEXT NOT NULL
);

CREATE TABLE Libros (
    ID_Libro INTEGER PRIMARY KEY AUTOINCREMENT,
    ISBN TEXT UNIQUE,
    Titulo TEXT NOT NULL,
    Genero TEXT,
    Ubicacion_Fisica TEXT,
    Cantidad_Total_Ejemplares INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE Estados_Prestamo (
    ID_Estado_Prestamo INTEGER PRIMARY KEY AUTOINCREMENT,
    Descripcion TEXT NOT NULL UNIQUE
);

CREATE TABLE Estados_Multa (
    ID_Estado_Multa INTEGER PRIMARY KEY AUTOINCREMENT,
    Descripcion TEXT NOT NULL UNIQUE
);

-- -----------------------------
-- Tablas con dependencias
-- -----------------------------

CREATE TABLE Libro_Autor (
    ID_Libro INTEGER NOT NULL,
    ID_Autor INTEGER NOT NULL,
    PRIMARY KEY (ID_Libro, ID_Autor),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro) ON DELETE CASCADE,
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor) ON DELETE CASCADE
);

CREATE TABLE Prestamos (
    ID_Prestamo INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Socio INTEGER NOT NULL,
    ID_Libro INTEGER NOT NULL,
    ID_Estado_Prestamo INTEGER NOT NULL,
    Fecha_Prestamo TEXT NOT NULL,
    Fecha_Devolucion_Estimada TEXT NOT NULL,
    Fecha_Devolucion_Real TEXT,
    
    FOREIGN KEY (ID_Socio) REFERENCES Socios(ID_Socio) ON DELETE RESTRICT,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro) ON DELETE RESTRICT,
    FOREIGN KEY (ID_Estado_Prestamo) REFERENCES Estados_Prestamo(ID_Estado_Prestamo) ON DELETE RESTRICT
);

CREATE TABLE Multas (
    ID_Multa INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Prestamo INTEGER NOT NULL UNIQUE, -- Relación 1-a-1
    ID_Estado_Multa INTEGER NOT NULL,
    Monto REAL NOT NULL,
    Fecha_Generacion TEXT NOT NULL,
    
    FOREIGN KEY (ID_Prestamo) REFERENCES Prestamos(ID_Prestamo) ON DELETE CASCADE,
    FOREIGN KEY (ID_Estado_Multa) REFERENCES Estados_Multa(ID_Estado_Multa) ON DELETE RESTRICT
);

-- -----------------------------
-- Datos iniciales para Estados
-- (Muy recomendado)
-- -----------------------------

INSERT INTO Estados_Prestamo (Descripcion) 
VALUES ('Activo'), ('Devuelto'), ('Vencido');

INSERT INTO Estados_Multa (Descripcion) 
VALUES ('Pendiente'), ('Pagada');