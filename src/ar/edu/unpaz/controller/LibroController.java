package ar.edu.unpaz.controller;

import java.util.List;

import ar.edu.unpaz.domain.Libro;
import ar.edu.unpaz.service.ILibroService;

public class LibroController implements ILibroController{
	private ILibroService service;
	public LibroController(ILibroService service) {
		this.service = service;
	}
	
	@Override
	public String mostrarLibros() {
		// TODO Auto-generated method stub
		List<Libro> libros = this.service.getAll();
		return null;
	}

	@Override
	public String detalleLibro(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
