package main;

import java.sql.*;

public class Main {

	public static void main(String[] args) {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost/Proyecto";
			String username = "root";
			String password = "root1234?";
			
			Class.forName(driver);
			
			Connection connection = (Connection) DriverManager.getConnection(url, username, password);
			
			String query = "SELECT * FROM Docente";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) 
		      {
		       System.out.print(" DNI: " + resultSet.getString("DNI_docente"));
		       System.out.print("; Nombre: "+resultSet.getString("dedicacion"));
		       System.out.print("\n   ");
		       System.out.print("\n   ");
		    } 
		}
		catch(ClassNotFoundException cnfe) {
		    System.err.println("Error loading driver: " + cnfe);
		    cnfe.printStackTrace();
		} catch(SQLException sqle) {
		    sqle.printStackTrace();
		    System.err.println("Error connecting: " + sqle);
		} catch(Exception sqle) {
		  	sqle.printStackTrace();
		    System.err.println("Error connecting: " + sqle);
		
	}
	}
}
