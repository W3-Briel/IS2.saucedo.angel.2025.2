package ar.edu.unpaz.controller;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unpaz.domain.Libro;
import ar.edu.unpaz.service.ILibroService;

public class LibroController implements ILibroController{
	private ILibroService service;
	public LibroController(ILibroService service) {
		this.service = service;
	}
	
	@Override
	public List<String> mostrarLibros() {
		// TODO Auto-generated method stub
		List<Libro> libros = this.service.getAll();
		List<String> librosHeader = new ArrayList<String>();
		libros.forEach(libro -> librosHeader.add(String.format("ID: %s Titulo: %s", libro.getId() ,libro.getTitulo())));
		
		return librosHeader;
	}

	@Override
	public String detalleLibro(Integer id) {
		Libro libro = this.service.getById(id);
		return String.format("--> ID: %d, Titulo: %s, ISBN: %s, Ubicacion: %s, ejemplares: %s",
				libro.getId(), libro.getTitulo(),
				libro.getISBN(),libro.getUbicacion_fisica(),
				libro.getCantidad_total_ejemplares());
	}

}
