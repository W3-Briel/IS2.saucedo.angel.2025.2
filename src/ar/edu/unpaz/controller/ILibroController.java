package ar.edu.unpaz.controller;

import java.util.List;

public interface ILibroController {
	List<String> mostrarLibros();
	String detalleLibro(Integer id);
}
