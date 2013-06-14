package br.com.fiap.si.tp2.trabalho.factory;

import java.sql.*;

public class ConnectionFactory {	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {

			ex.printStackTrace();

			System.exit(1);

		}
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost/tarefas", "root", "root");
		} catch (Exception e) {
			System.err.print("\nErro ao conectar!.\n" + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException(e);
		}
				
	}

}

