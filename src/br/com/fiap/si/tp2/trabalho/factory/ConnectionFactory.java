package br.com.fiap.si.tp2.trabalho.factory;

import java.sql.*;

public class ConnectionFactory {
	
	private static final String DRIVER_MYSQL = "com.mysql.jdbc.Driver";
	private static final String USUARIO = "root";
	private static final String SENHA = "root";
	private static final String JDBC_URL = "jdbc:mysql://localhost/";
	private static final String BASE = "tarefas";
		
	public static Connection getConnection() throws SQLException {
		String tteste = "";
		try{
			Class.forName(DRIVER_MYSQL);
			
		}catch(ClassNotFoundException ex){
			System.out.println("Driver n�o encontrado " + ex.getMessage());
		}
		
		return DriverManager.getConnection((JDBC_URL + BASE), USUARIO, SENHA);
				
	}

}

