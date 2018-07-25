package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	public static Connection getConnection() throws SQLException {
		System.out.println("콘넥션@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:navertest");
	}

}
