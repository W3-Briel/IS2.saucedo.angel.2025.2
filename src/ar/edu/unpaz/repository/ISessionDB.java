package ar.edu.unpaz.repository;

import java.sql.Connection;
import java.sql.SQLException;

public interface ISessionDB {
	Connection getConnection() throws SQLException;
	void close();
}
