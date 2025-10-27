Codigo mermaid del diagrama MER

``` MMD
erDiagram
    Socios {
        INTEGER ID_Socio PK
        TEXT Nombre
        TEXT Apellido
        TEXT Email
        TEXT Estado
    }

    Prestamos {
        INTEGER ID_Prestamo PK
        INTEGER ID_Socio FK
        INTEGER ID_Libro FK
        INTEGER ID_Estado_Prestamo FK
        TEXT Fecha_Prestamo
        TEXT Fecha_Devolucion_Estimada
        TEXT Fecha_Devolucion_Real
    }

    Estados_Prestamo {
        INTEGER ID_Estado_Prestamo PK
        TEXT Descripcion "Ej: Activo, Devuelto, Vencido"
    }

    Multas {
        INTEGER ID_Multa PK
        INTEGER ID_Prestamo FK "Relación 1-a-1 (UNIQUE)"
        INTEGER ID_Estado_Multa FK
        REAL Monto
        TEXT Fecha_Generacion
    }

    Estados_Multa {
        INTEGER ID_Estado_Multa PK
        TEXT Descripcion "Ej: Pendiente, Pagada"
    }

    Libros {
        INTEGER ID_Libro PK
        TEXT ISBN
        TEXT Titulo
        TEXT Genero
        TEXT Ubicacion_Fisica
        INTEGER Cantidad_Total_Ejemplares
    }

    Autores {
        INTEGER ID_Autor PK
        TEXT Nombre_Completo
    }

    Libro_Autor {
        INTEGER ID_Libro FK "PK Compuesto"
        INTEGER ID_Autor FK "PK Compuesto"
    }

    %% --- Definición de Relaciones ---

    %% Un Socio (1) puede tener muchos (N) Préstamos
    Socios ||--o{ Prestamos : "realiza"

    %% Un Libro (1) puede estar en muchos (N) Préstamos
    Libros ||--o{ Prestamos : "es_prestado_en"

    %% Un Préstamo (1) solo puede generar una (1) Multa
    Prestamos ||--|| Multas : "genera"

    %% --- Relación Muchos-a-Muchos (N-M) entre Libros y Autores ---
    Libros  ||--o{ Libro_Autor : "escrito_por"
    Autores ||--o{ Libro_Autor : "es_autor_de"

    %% --- Relaciones con las nuevas tablas de Estado ---
    
    %% Un Estado_Prestamo (1) puede estar en muchos (N) Préstamos
    Estados_Prestamo ||--o{ Prestamos : "define_estado"

    %% Un Estado_Multa (1) puede estar en muchas (N) Multas
    Estados_Multa ||--o{ Multas : "define_estado"
```
