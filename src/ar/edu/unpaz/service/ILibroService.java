package ar.edu.unpaz.service;

import java.util.List;

import ar.edu.unpaz.domain.Libro;

public interface ILibroService {
	Libro getById(Integer id);
	List<Libro> getAll();
}
