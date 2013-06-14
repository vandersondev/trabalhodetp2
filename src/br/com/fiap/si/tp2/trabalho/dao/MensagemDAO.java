package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fiap.si.tp2.trabalho.bean.MensagemBean;
import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class MensagemDAO {
	
	private Connection connection;
	private String sqlListMensagem = "SELECT usuario.id AS id_usuario, usuario.nome, mensagem.id AS id_mensagem, mensagem.de, mensagem.para, mensagem.mensagem, mensagem.assunto FROM mensagem INNER JOIN usuario ON usuario.id = mensagem.para WHERE (usuario.id = ?) ORDER BY mensagem.id DESC";
	private String sqlGetMensagem = "SELECT id, de, para, mensagem, assunto FROM mensagem WHERE id = ? LIMIT 1";
	private String sqlDeleteMensagem = "DELETE FROM mensagem WHERE id = ? ";
	private String sqlInsertMensagem = "INSERT INTO mensagem (de, para, mensagem, assunto) VALUES (?, ?, ?, ?)";
	
	public MensagemDAO() {
		this.connection = new ConnectionFactory().getConnection();
	} 
	
	public void insertMensagem(MensagemBean mensagem) {
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlInsertMensagem);
			stmt.setInt(1, mensagem.getDe().getId());
			stmt.setInt(2, mensagem.getPara().getId());
			stmt.setString(3, mensagem.getMensagem());
			stmt.setString(4, mensagem.getAssunto());
			
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteMensagem(int id) {
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlDeleteMensagem);
			stmt.setInt(1, id);
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<MensagemBean> ListaMensagens(UsuarioBean user, boolean limite) {
		
		if (limite) {
			this.sqlListMensagem += " LIMIT 5";
		}
		
		try {
			ArrayList<MensagemBean> mensagens = new ArrayList<MensagemBean>();
		
			PreparedStatement stmt = this.connection.prepareStatement(sqlListMensagem);
			stmt.setInt(1, user.getId());
			ResultSet rs = stmt.executeQuery();
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			
			while (rs.next()) {
				MensagemBean mensagem = new MensagemBean();
				UsuarioBean de = usuarioDao.getUsuario(rs.getInt("de"));
				mensagem.setId(rs.getInt("id_mensagem"));
				mensagem.setAssunto(rs.getString("assunto"));
				mensagem.setMensagem(rs.getString("mensagem"));
				mensagem.setDe(de);
				
				mensagens.add(mensagem);
			}
			
			return mensagens;
			
		
		} catch(SQLException e) {
			throw new RuntimeException(e);	
		}
		
		
	}
	
	public MensagemBean getMensagem(int id) throws SQLException {
		
		MensagemBean mensagem = new MensagemBean();
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlGetMensagem);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		
		UsuarioDAO usuarioDao = new UsuarioDAO();
		
		while (rs.next()) {
			UsuarioBean de = usuarioDao.getUsuario(rs.getInt("de"));
			mensagem.setId(rs.getInt("id"));
			mensagem.setAssunto(rs.getString("assunto"));
			mensagem.setMensagem(rs.getString("mensagem"));
			mensagem.setDe(de);
		}
		
		return mensagem;
	}
	
}
