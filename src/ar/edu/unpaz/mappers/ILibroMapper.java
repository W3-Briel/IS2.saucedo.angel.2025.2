package ar.edu.unpaz.mappers;

import java.sql.ResultSet;
import ar.edu.unpaz.domain.Libro;

public interface ILibroMapper {
	Libro toDomain(ResultSet setBBDD);
	String mapToPersistence(Libro libro);
}
