# 📝 Trabajo Práctico – Unidad 3: Diseño Arquitectónico

**Autor:** Angel Gabriel Saucedo

---

## Consigna

A partir del siguiente enunciado, deberás realizar un esquema o breve explicación escrita.

### Enunciado

> Imaginá que estás diseñando un sistema de gestión para una biblioteca (préstamo de libros, registro de socios, devoluciones, etc.).

1.  **Identificá las tres capas principales** del sistema (presentación, lógica de negocio, datos) y escribí qué tipo de funciones tendría cada una.
2.  **Elegí un problema sencillo** del sistema (por ejemplo: acceso centralizado a la base de datos, control de usuarios o manejo de configuración) y explicá con tus palabras qué patrón de diseño podría ayudar a resolverlo (por ejemplo: Singleton, MVC, etc.).

### Entrega

* **Esquema gráfico** (UML).
* **Validación del modelo** en el lenguaje de programación que usted elija.
* **Modalidad:** Individual.
* **Plazo:** 28-09-2025 23:59.

---

## 📚 Biblioteca - Relevamiento

### Glosario

* **Usuario:** es el bibliotecario encargado del sistema.
* **Socios:** son los clientes que tienen acceso a realizar un pedir un préstamo de un libro. no tienen acceso al sistema.
* **Multa:** la multa es un cargo adicional que se realiza en un pedido, por no ser devuelto a tiempo o algún inconveniente con el material.
* **cantidad de ejemplares:** es la cantidad de copias de libros que son de la biblioteca, no tiene en cuenta los libros prestados.
* **ejemplares disponibles:** cantidad de ejemplares que están disponibles (en el establecimiento) actualmente para poder ser prestados
* **Devoluciones de libro:** un préstamo se completa cuando se devuelve físicamente el libro.
* **Préstamo:** son los libros que se prestan a los socios. estos libros deben ser entregados en tiempo o si no se le cargará una multa en el sistema.

### Requerimientos funcionales

* `req 001` registrar de socios
* `req 002` ver lista de socios
* `req 003` editar datos de un socio
* `req 004` eliminar un socio
* `req 005` prestar un libro
* `req 006` historial de préstamos: el usuario posee una pantalla con el historial de todos los préstamos que se realizaron en el sistema, y puede filtrarlos por; usuario, fecha, estado
* `req 007` devoluciones de libros: el usuario puede cargar en el sistema cuando un libro se devuelve correctamente
* `req 008` ver multas: el usuario debe ver todas las multas de los pedidos que no fueron pagados o devueltos en tiempo y forma
* `req 009` lista de libros: el usuario debe poder ver la lista de todos los libros que tiene en el sistema, y mostrar por cada uno una cabecera que indique de manera rápida: disponibilidad en stock, título, género y un botón para acceder al detalle del libro. Además, se podrá filtrar esta por disponibilidad, género, título y autor.
* `req 010` detalle del libro: el usuario podrá ver toda la información en cuanto a ese libro:
    * Título y subtítulo.
    * Autor(es).
    * ISBN (International Standard Book Number) para una identificación única.
    * Editorial y año de publicación.
    * Género o categoría.
    * Ubicación física en la biblioteca (estantería, sección).
    * cantidad de ejemplares.
    * ejemplares disponibles.
* `req 010` notificaciones vencimientos: el usuario puede ver una lista con todos los pedidos próximos a vencer, y para cada uno, enviar un recordatorio por email u otro medio.
