package ar.edu.unpaz.app;

import ar.edu.unpaz.controller.LibroController;

public class Main {

	public static void main(String[] args) {		
		//composicion del workflow Libro
		
		//falta service
		LibroController libroController = new LibroController();
		MenuCLI consola = new MenuCLI(libroController);
		
		consola.mostrarLibros();
		
	}

}
