package ar.edu.unpaz.app;

import ar.edu.unpaz.controller.ILibroController;

public class MenuCLI {
	private ILibroController controller;
	
	public MenuCLI (ILibroController controller) {
		this.controller = controller;
	}

	public void mostrarLibros() {
		System.out.println("--- LIBROS ---");
		
		this.controller.mostrarLibros()
			.forEach(System.out::println);
	}
	public void detalleLibro() {
		System.out.println("-- DETALLE --");
		// validar que la id ingresada sea un numero.
		System.out.println(this.controller.detalleLibro(123123));
	}
}
