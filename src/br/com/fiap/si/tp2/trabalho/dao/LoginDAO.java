package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.*;

import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class LoginDAO {
	
	private PreparedStatement prepStmtSelectUser = null;
	
	private static final String SELECT_USER = "select * from usuario where email = ? and senha = ?;";
	
	public boolean validaLogin(String email, String senha) throws SQLException{
		
		Connection conn = ConnectionFactory.getConnection();
		
		prepStmtSelectUser = conn.prepareStatement(SELECT_USER);
		prepStmtSelectUser.setString(1, email);
		prepStmtSelectUser.setString(2, senha);
		
		ResultSet rs = prepStmtSelectUser.executeQuery();
		
		while(rs.next()){
			UsuarioBean user = new UsuarioBean();
			user.setId(rs.getInt("id"));
			user.setNome(rs.getString("nome"));
			user.setEmail(rs.getString("email"));
			user.setSenha(rs.getString("senha"));
			user.setIsAdmin(rs.getBoolean("admin"));
			return true;
		}
			
		return false;
	}
}
