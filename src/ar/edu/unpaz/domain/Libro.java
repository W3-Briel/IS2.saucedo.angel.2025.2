package ar.edu.unpaz.domain;

public class Libro {
    private Integer id; // Ya tenías este
    private String ISBN;
    private String titulo;
    private String genero;
    private String ubicacion_fisica;
    private Integer cantidad_total_ejemplares;

    // --- AÑADIDO: Constructor vacío ---
    // Necesario para que el Mapper pueda crear un objeto
    public Libro() {
    }
    
    // --- Constructor original (sigue siendo útil) ---
    public Libro(String iSBN, String titulo, String genero, String ubicacion_fisica,
            Integer cantidad_total_ejemplares) {
        super();
        ISBN = iSBN;
        this.titulo = titulo;
        this.genero = genero;
        this.ubicacion_fisica = ubicacion_fisica;
        this.cantidad_total_ejemplares = cantidad_total_ejemplares;
    }

    // --- AÑADIDO: Getters y Setters para ID ---
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    // --- Resto de tus getters y setters (estaban bien) ---
    
    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUbicacion_fisica() {
        return ubicacion_fisica;
    }

    public void setUbicacion_fisica(String ubicacion_fisica) {
        this.ubicacion_fisica = ubicacion_fisica;
    }

    public Integer getCantidad_total_ejemplares() {
        return cantidad_total_ejemplares;
    }

    public void setCantidad_total_ejemplares(Integer cantidad_total_ejemplares) {
        this.cantidad_total_ejemplares = cantidad_total_ejemplares;
    }
}