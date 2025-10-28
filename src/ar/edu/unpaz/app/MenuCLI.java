package ar.edu.unpaz.app;

import ar.edu.unpaz.controller.ILibroController;

public class MenuCLI {
	private ILibroController controller;
	
	public MenuCLI (ILibroController controller) {
		this.controller = controller;
	}

	public void mostrarLibros() {
		System.out.print(this.controller.mostrarLibros());
	}
}
