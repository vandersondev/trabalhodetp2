package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class UsuarioDAO {

	private Connection connection;
	private String sqlLogin = "SELECT * FROM usuario WHERE mail = ? AND senha = ?;";
	private String sqlInsert = "INSERT INTO tarefas.usuario (admin, nome, mail, senha) VALUES (?, ?, ?, ?)";
	private String sqlCheck = "SELECT * FROM usuario WHERE mail = ?";
	private String selectUsuario = "SELECT * FROM usuario WHERE id = ?";
	private String sqlListUsuarios = "SELECT * FROM usuario";
	private String sqlDeleteUsuario = "DELETE FROM usuario WHERE id= ?";
	private String sqlMakeAdmin = "UPDATE usuario SET admin = 1 WHERE id = ?";
	
	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void makeAdminUsuario(int id) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlMakeAdmin);
		stmt.setInt(1, id);
		stmt.execute();
	}
	
	public void deletaUsuario(int id) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlDeleteUsuario);
		stmt.setInt(1, id);
		stmt.execute();
	}
	
	public ArrayList<UsuarioBean> getUsuarios(boolean notAdmins) throws SQLException {
		
		if (notAdmins) {
			this.sqlListUsuarios += " WHERE admin = 0";
		}
		
		ArrayList<UsuarioBean> usuarios = new ArrayList<UsuarioBean>();
		PreparedStatement stmt = this.connection.prepareStatement(sqlListUsuarios);
		ResultSet rs = stmt.executeQuery();

		UsuarioBean user = null;
		
		while(rs.next()){
			user = new UsuarioBean();
			user.setId(rs.getInt("id"));
			user.setNome(rs.getString("nome"));
			user.setMail(rs.getString("mail"));
			user.setSenha(rs.getString("senha"));
			user.setIsAdmin(rs.getInt("admin"));
			
			usuarios.add(user);
			
		}
		
		stmt.close();
		return usuarios;
	}
	
	public UsuarioBean getUsuario(int id) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(selectUsuario);
		stmt.setInt(1, id);
		
		ResultSet rs = stmt.executeQuery();

		UsuarioBean user = null;
		
		while(rs.next()){
			user = new UsuarioBean();
			user.setId(rs.getInt("id"));
			user.setNome(rs.getString("nome"));
			user.setMail(rs.getString("mail"));
			user.setSenha(rs.getString("senha"));
			user.setIsAdmin(rs.getInt("admin"));
		}
		stmt.close();
		return user;
	}
	
	public UsuarioBean validaLogin(String mail, String senha) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlLogin);
		stmt.setString(1, mail);
		stmt.setString(2, senha);
		
		ResultSet rs = stmt.executeQuery();

		UsuarioBean user = null;
		
		while(rs.next()){
			user = new UsuarioBean();
			user.setId(rs.getInt("id"));
			user.setNome(rs.getString("nome"));
			user.setMail(rs.getString("mail"));
			user.setSenha(rs.getString("senha"));
			user.setIsAdmin(rs.getInt("admin"));
		}
		stmt.close();
		return user;
	}
	
	public void cadastrarUsuario(UsuarioBean user) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlInsert);
		stmt.setInt(1, 0);
		stmt.setString(2, user.getNome());
		stmt.setString(3, user.getMail());
		stmt.setString(4, user.getSenha());
		stmt.execute();
		stmt.close();

	}
	
	public boolean verificaUsuario(UsuarioBean user) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlCheck);
		stmt.setString(1, user.getMail());
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			if(rs.getString("mail").equals(user.getMail())) {
				return true;
			}
		}
		
		return false;
	}
	
}
