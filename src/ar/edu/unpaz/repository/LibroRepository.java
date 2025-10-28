package ar.edu.unpaz.repository;

import java.util.List;

import ar.edu.unpaz.domain.Libro;
import ar.edu.unpaz.mappers.ILibroMapper;

public class LibroRepository implements ILibroRepository{
	private ILibroMapper mapper;
	
	public LibroRepository(ILibroMapper mapper) {
		this.mapper = mapper;
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
