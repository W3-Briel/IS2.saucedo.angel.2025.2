package ar.edu.unpaz.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ar.edu.unpaz.domain.Libro;
import ar.edu.unpaz.mappers.ILibroMapper;

public class LibroRepository implements ILibroRepository{
	private ILibroMapper mapper;
	private ISessionDB db;
	
	public LibroRepository(ILibroMapper mapper, ISessionDB db) {
		this.mapper = mapper;
		this.db = db;
	}
	
	@Override
	public List<Libro> getAll() {
		List<Libro> libros = new ArrayList<>();
		String sql = "SELECT * FROM libros";
		
		try (Connection conn = db.getConnection();
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(sql)) {
			
			while (rs.next()) {
				// Usamos el mapper para convertir la fila actual en un objeto Libro
				libros.add(mapper.toDomain(rs));
			}
			
		} catch (SQLException e) {
			System.err.println("Error al obtener todos los libros: " + e.getMessage());
		}
		
		return libros;
	}

	@Override
	public Libro getById(Integer id) {
		Libro libro = null;
		String sql = "SELECT * FROM libros WHERE ID_Libro = ?"; // Usamos '?' para un PreparedStatement
		
		try (Connection conn = db.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			// Asignamos el valor del ID al '?' (el primer parámetro)
			pstmt.setInt(1, id);
			
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					libro = mapper.toDomain(rs);
				}
			}
			
		} catch (SQLException e) {
			System.err.println("Error al obtener el libro por ID: " + e.getMessage());
		}
		
		return libro;
	}

}