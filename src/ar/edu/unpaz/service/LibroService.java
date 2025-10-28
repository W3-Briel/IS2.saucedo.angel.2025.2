package ar.edu.unpaz.service;

import java.util.List;

import ar.edu.unpaz.domain.Libro;
import ar.edu.unpaz.repository.ILibroRepository;

public class LibroService implements ILibroService{
	private ILibroRepository repository;
	public LibroService (ILibroRepository repo) {
		this.repository = repo;
	}
	
	@Override
	public List<Libro> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Libro getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
