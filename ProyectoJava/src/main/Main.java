package main;

import java.io.FileReader;
import java.sql.*;
import java.util.Properties;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		try {
	        FileReader reader = new FileReader("db.properties");
	  
	        Properties p = new Properties();
	  
	        p.load(reader);
	        
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost/Proyecto";
			String username = p.getProperty("username");
			String password = p.getProperty("password");
			
			Class.forName(driver);
			
			Connection connection = (Connection) DriverManager.getConnection(url, username, password);
			
			boolean bool = true;
			while(bool) {
				System.out.println("Desea la opcion que quieras:");
				System.out.println("1 - Si quieres insertar actividades");
				System.out.println("2 - Si quieres eliminar una materia");
				System.out.println("3 - Si quieres ver todos los alumnos de una materia");
				System.out.println("4 - Salir");
				System.out.print("Ingresa la opcion: ");
				
				Scanner s = new Scanner(System.in);
				
				int opcion = s.nextInt();
				s.nextLine();
				
				switch (opcion) 
		        {
		            case 1:
						System.out.print("Ingresa la descripcion de la actividad ");
						String desc_actividad = s.nextLine();
						
						System.out.print("Ingresa de que materia es la actividad ");
						int cod_materia = s.nextInt();
						
						String query = insertarActividades(desc_actividad,cod_materia);
						PreparedStatement statement = connection.prepareStatement(query);
						statement.executeUpdate();
						System.out.println("Actividad ingresada correctamente.");
		                break;
		            case 2:  
		            	System.out.println("Ingrese el codigo de la materia que desea eliminar:");
		                int codigo = s.nextInt();
		                while (codigo < 1) {
		                	System.out.println("Debe ingresar un numero mayor a 0");
		                	System.out.println("Por favor, intente nuevamente");
		                	codigo = s.nextInt();
		                }
		            	String query2 = eliminarMateria(codigo);  
		            	PreparedStatement statement2 = connection.prepareStatement(query2);
		            	statement2.executeUpdate();
		            	break;
		            case 3: 
		            	System.out.print("Ingresa la materia deseada: ");
						int cod_mat  = s.nextInt();
		            	
						String query3 = alumnosDeMateria(cod_mat);
						
						PreparedStatement statement3 = connection.prepareStatement(query3);
						ResultSet resultSet2 = statement3.executeQuery();
						
						while(resultSet2.next()) 
					      {
					       System.out.print(" DNI: " + resultSet2.getString("DNI"));
					       System.out.print("; Nombre: "+resultSet2.getString("nombre") + " " +resultSet2.getString("apellido"));
					       System.out.print("; Direccion: "+resultSet2.getString("direccion"));
					       System.out.print("\n   ");
					       System.out.print("\n   ");
					    }
		                break;
		            case 4:
		            	bool = false;
		            	System.out.println("Gracias por usar nuestra base de datos :)");
		            	break;
		            default: System.out.print("Opcion incorrecta");
		                     break;
		        }
			}
		connection.close();     
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
	
	
	/**
	 * Forma un query en forma de String para insertar Actividades.
	 * @param desc_actividad descripcion de la actividad
	 * @param cod_materia codigo de la materia asociada a la actividad
	 * @return un query en forma de String
	 */
	public static String insertarActividades(String desc_actividad, int cod_materia) {
		String query = "INSERT INTO Actividad (desc_actividad,cod_materia) VALUES" 
		+ "('" + desc_actividad + "'" + "," + cod_materia + ");";		
		//('TP3 8queens',0005),
		return query;
	}
	
	/**
	 * Crea una consulta que elimina una materia dado su codigo
	 * @param cod_materia codigo de la materia a eliminar (int (positivo)) 
	 * @return consulta (String)
	 */
	public static String eliminarMateria(int cod_materia) {
		String query = "DELETE FROM Materia WHERE cod_materia = " + cod_materia;
		return query;
	}
	
	/**
	 * Forma un query en forma de String para devolver los datos de alumnos de una materia dada
	 * @param cod_materia codigo de la materia
	 * @return un query en forma de String
	 */
	public static String alumnosDeMateria(int cod_materia) {
		String query = "SELECT * FROM (SELECT DNI_alumno FROM Cursa WHERE cod_materia = " + cod_materia + ") as dni_alumnos JOIN Persona WHERE DNI = DNI_alumno";
		return query;
	}
}






































