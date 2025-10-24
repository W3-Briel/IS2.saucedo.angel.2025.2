package ar.edu.unpaz.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import ar.edu.unpaz.domain.Libro;

public class LibroMapper implements ILibroMapper{

	@Override
    public Libro toDomain(ResultSet setBBDD) {
        Libro libro = null;
        try {
            libro = new Libro(); 
            
            libro.setId(setBBDD.getInt("ID_Libro"));
            libro.setISBN(setBBDD.getString("ISBN"));
            libro.setTitulo(setBBDD.getString("Titulo"));
            libro.setGenero(setBBDD.getString("Genero"));
            libro.setUbicacion_fisica(setBBDD.getString("Ubicacion_Fisica"));
            libro.setCantidad_total_ejemplares(setBBDD.getInt("Cantidad_Total_Ejemplares"));

        } catch (SQLException e) {
            System.err.println("Error al mapear el ResultSet a Libro: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
        return libro;
    }

	@Override
	public String mapToPersistence(Libro libro) {
		// TODO Auto-generated method stub
		return null;
	}

}
