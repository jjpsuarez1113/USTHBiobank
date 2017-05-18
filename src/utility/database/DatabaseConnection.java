package utility.database;

//import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

import javax.sql.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;


public class DatabaseConnection{

	private static Connection connection;

	private DatabaseConnection() {
	}

	// NEW CONNECTION
	private static Connection getDBConnection() {
		try {
			InitialContext context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/BCI-DS");

			if (dataSource != null) {
				connection = dataSource.getConnection();
			} else {
				System.err.println("DataSource is NULL.");
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static Connection getConnection() {
		System.out.println("Connection successful");
		return (connection != null) ? connection : getDBConnection();
	}
}
