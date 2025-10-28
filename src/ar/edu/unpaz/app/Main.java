package ar.edu.unpaz.app;

import ar.edu.unpaz.controller.ILibroController;
import ar.edu.unpaz.controller.LibroController;
import ar.edu.unpaz.mappers.ILibroMapper;
import ar.edu.unpaz.mappers.LibroMapper;
import ar.edu.unpaz.repository.ILibroRepository;
import ar.edu.unpaz.repository.LibroRepository;
import ar.edu.unpaz.service.ILibroService;
import ar.edu.unpaz.service.LibroService;

public class Main {

	public static void main(String[] args) {		
		//composicion del workflow Libro
		
		ILibroMapper libroMapper = new LibroMapper();
		ILibroRepository libroRepository = new LibroRepository(libroMapper);
		ILibroService libroService = new LibroService(libroRepository);
		ILibroController libroController = new LibroController(libroService);
		
		
		MenuCLI consola = new MenuCLI(libroController);
		consola.mostrarLibros();
		
	}

}
