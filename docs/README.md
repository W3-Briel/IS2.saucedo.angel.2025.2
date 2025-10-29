# Sistema de Biblioteca
---

## 📚 Desglose de Capas y Componentes

### 1. Capa de Presentación (Vista)

* `MenuCLI`: Es la **interfaz de usuario** (UI). En tu caso, es una **C**ommand **L**ine **I**nterface (CLI).
    * **Responsabilidad:** Mostrar información al usuario y capturar sus entradas (ej. "mostrar todos los libros").
    * **Dependencia Clave:** Depende de `ILibroController` (una interfaz). No sabe *cómo* se obtienen los libros, solo sabe a *quién* pedírselos.

### 2. Capa de Control (Controlador)

* `ILibroController` (Interfaz): Define el "contrato" de lo que la capa de presentación puede hacer.
* `LibroController` (Clase): Es la **implementación** de ese contrato.
    * **Responsabilidad:** Actuar como un intermediario. Recibe peticiones simples de la vista (`MenuCLI`) y las traduce en llamadas a la lógica de negocio.
    * **Dependencia Clave:** Depende de `ILibroService`.

### 3. Capa de Servicio (Lógica de Negocio)

* `ILibroService` (Interfaz): Define el "contrato" de las operaciones de negocio.
* `LibroService` (Clase): Aquí es donde reside la **lógica de negocio principal** (Business Logic).
    * **Responsabilidad:** Orquestar las operaciones. Si para "ObtenerLibros" necesitaras, por ejemplo, aplicar un filtro de descuentos o verificar el stock, esa lógica iría aquí.
    * **Dependencia Clave:** Depende de `LibroRepository`.

### 4. Capa de Acceso a Datos (Repositorio)
* `ILibroMapper` (Interfaz): Define el "contrato" para los mappers (ej. `toDomain`, `mapToPersistence`).
* `LibroMapper` (Clase): se encarga de convertir la informacion que devuelve la bbdd a una entidad de dominio.
* `ISessionDB` (Interfaz): se define el contrato para la conexion con la bbdd (ej. `getConnection`,`close`)
* `SessionDB` (Clase): Esta clase gestiona la conexión a la base de datos.
* `ILibroRepo` (Interfaz): Define el "contrato" para la persistencia de datos (ej. `getAll`, `getByID`).
* `LibroRepository` (Clase): Es el **único** componente que sabe cómo hablar con la base de datos.
    * **Responsabilidad:** Abstraer la lógica de la base de datos. Traduce las llamadas del servicio (como `getAll()`) a consultas SQL (o el lenguaje de la base de datos que uses).
    * **Dependencias Clave:** Depende de `ISessionDB` (para obtener la conexión) y de `ILibroMapper` (para convertir los datos).

---

## 🏛️ Patrones de Diseño Clave

### 1. Inversión de Dependencias (Principio D de SOLID)

* **Qué es:** Las clases de alto nivel (como `MenuCLI` o `LibroController`) no dependen de clases de bajo nivel (como `LibroService` o `LibroRepository`). En su lugar, **ambas dependen de abstracciones (interfaces)**.
* **Ejemplo:** `MenuCLI` no conoce a `LibroController`; solo conoce a `ILibroController`.
* **Beneficio:** Te permite cambiar las implementaciones fácilmente. Podrías crear un `LibroControllerMock` para hacer pruebas, o reemplazar `LibroRepository` con un `LibroRepositoryMongo` sin tener que cambiar `LibroService`.

### 2. Inyección de Dependencias (DI) y Composition Root

Para gestionar las dependencias entre capas (ej. el `Controlador` necesita un `Servicio`, el `Servicio` necesita un `Repositorio`), se utilizo el principio de **Inversión de Dependencias (DIP)**.
Aplicamos el patrón **Composition Root**. Esto significa que toda la "construcción" y "cableado" de las dependencias ocurre en un único lugar centralizado: la clase `Main` de la aplicación.
Esto nos permite mantener las clases de lógica de negocio (como `LibroService`) limpias y desacopladas de las implementaciones concretas, facilitando enormemente las pruebas unitarias (al poder inyectar "Mocks") y el mantenimiento.

### 3. Patrón Repositorio (Repository Pattern)

* **Qué es:** `LibroRepository` actúa como una "colección en memoria" de tus objetos `Libro`.
* **Beneficio:** La capa de servicio (`LibroService`) no tiene idea de si los datos vienen de una base de datos SQL, un archivo de texto o una API. Solo pide los datos al repositorio.

### 4. Patrón Singleton

* `SessionDB`: Esta clase gestiona la conexión a la base de datos.
* **Qué es:** El método `getInstance()` asegura que solo exista **una única instancia** de `SessionDB` en toda la aplicación.
* **Beneficio:** Evita crear múltiples conexiones costosas a la base de datos, reutilizando la misma.

### 5. Patrón Mapper (o DTO - Data Transfer Object)

* `LibroMapper`: Es un traductor.
* **Responsabilidad:** Tiene dos trabajos clave:
    1.  `toDomain()`: Convierte los datos crudos de la base de datos (como un `ResultSet` de SQL) en un objeto de tu dominio (`Libro`).
    2.  `mapToPersistence()`: Convierte un objeto `Libro` en datos que la base de datos entienda (para un `INSERT` o `UPDATE`).

---

## 🌊 Flujo de Ejemplo: `mostrarLibros()`

Flujo de una petición:

1.  El **Usuario** interactúa con `MenuCLI`.
2.  `MenuCLI` llama al método `mostrarLibros()` de su variable `ILibroController`.
3.  Eclipse (o tu framework de Inyección de Dependencias) dirige esa llamada a la implementación: `LibroController`.
4.  `LibroController` llama a `ObtenerLibros()` en su variable `ILibroService`.
5.  `LibroService` (la implementación) recibe la llamada. Para cumplirla, llama a `getAll()` en su `LibroRepository`.
6.  `LibroRepository` necesita la conexión: llama a `SessionDB.getInstance()`.
7.  `LibroRepository` ejecuta la consulta SQL.
8.  Recibe un `ResultSet` (datos crudos) de la base de datos.
9.  `LibroRepository` le pasa el `ResultSet` a `LibroMapper.toDomain()`.
10. `LibroMapper` devuelve una lista de objetos `Libro` (POJOs limpios).
11. La lista de `Libro` se devuelve hacia arriba: del Repositorio al Servicio, del Servicio al Controlador.
12. `LibroController` devuelve la lista de `Libro` a `MenuCLI`.
13. `MenuCLI` recibe la lista y la formatea para mostrarla al usuario en la consola.
