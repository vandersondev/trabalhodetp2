package br.com.fiap.si.tp2.trabalho.factory;

import java.sql.*;

public class ConnectionFactory {	
	public Connection getConnection() {
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost/tarefas", "root", "root");
		} catch (Exception e) {
			System.err.print("\nErro ao conectar!.\n");
			throw new RuntimeException(e);
		}
				
	}

}

