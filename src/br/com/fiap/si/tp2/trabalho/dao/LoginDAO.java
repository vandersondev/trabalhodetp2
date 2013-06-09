package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.*;

import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class LoginDAO {
	
	private PreparedStatement prepStmtSelectUser = null;
	private Connection connection;
	
	private static final String SELECT_USER = "select * from usuario where mail = ? and senha = ?;";
	
	public LoginDAO() throws SQLException {
		System.out.print("1");
		this.connection = new ConnectionFactory().getConnection();
		System.out.print("Conectado");
	}
	
	public boolean validaLogin(String email, String senha) throws SQLException{
		
		prepStmtSelectUser = connection.prepareStatement(SELECT_USER);
		prepStmtSelectUser.setString(1, email);
		prepStmtSelectUser.setString(2, senha);
		
		ResultSet rs = prepStmtSelectUser.executeQuery();
		
		while(rs.next()){
			UsuarioBean user = new UsuarioBean();
			user.setId(rs.getInt("id"));
			user.setNome(rs.getString("nome"));
			user.setMail(rs.getString("email"));
			user.setSenha(rs.getString("senha"));
			user.setIsAdmin(rs.getBoolean("admin"));
			return true;
		}
		connection.close();
		return false;
	}
}
