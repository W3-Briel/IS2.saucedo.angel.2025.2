package ar.edu.unpaz.repository;

import java.util.List;

import ar.edu.unpaz.domain.Libro;

public interface ILibroRepository {
	
	List<Libro> getAll();
	Libro getById(Integer id);
}
