package ar.edu.unpaz.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SessionDB implements ISessionDB { 

    private static final String DB_URL = "jdbc:sqlite:bbdd/biblioteca.db";
    private Connection conn;
    
    private SessionDB() {
        try {
            Class.forName("org.sqlite.JDBC");
            this.conn = DriverManager.getConnection(DB_URL);
            System.out.println("Conexión a SQLite establecida (Singleton).");
        } catch (Exception e) {
            System.err.println("Error al conectar: " + e.getMessage());
        }
    }
    
    private static class SingletonHolder {
        private static final SessionDB INSTANCE = new SessionDB();
    }
    
    public static SessionDB getInstance() {
        return SingletonHolder.INSTANCE;
    }
    
    @Override
    public Connection getConnection() {
        return this.conn;
    }

    @Override
    public void close() {
        try {
            if (this.conn != null && !this.conn.isClosed()) {
                this.conn.close();
                System.out.println("Conexión a SQLite cerrada.");
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}