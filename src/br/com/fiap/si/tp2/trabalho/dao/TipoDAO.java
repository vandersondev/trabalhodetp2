package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fiap.si.tp2.trabalho.bean.TipoBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class TipoDAO {
	private Connection connection;
	private String sqlListTipo = "SELECT * FROM tipo";
	private String selectTipo = "SELECT * FROM tipo WHERE id = ?";
	private String deleteTipo = "DELETE FROM tipo WHERE id = ?";
	private String inserirTipo = "INSERT INTO tipo (tipo) VALUES (?)";
	
	public TipoDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void cadastrarTipo(TipoBean tipo) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(inserirTipo);
		stmt.setString(1, tipo.getTipo());
		stmt.execute();
		stmt.close();

	}

	public void excluirTipo(int id) {
		try {
			PreparedStatement stmt = this.connection.prepareStatement(deleteTipo);
			stmt.setInt(1, id);
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<TipoBean> getTipos() throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlListTipo);

		ResultSet rs = stmt.executeQuery();
		
		ArrayList<TipoBean> tipos = new ArrayList<TipoBean>();
		
		while(rs.next()){
			TipoBean tipo = new TipoBean();
			tipo.setId(rs.getInt("id"));
			tipo.setTipo(rs.getString("tipo"));
			
			tipos.add(tipo);
			
		}
		
		stmt.close();
		return tipos;
	}
	
	public TipoBean getTipo(int id) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(selectTipo);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		
		
		TipoBean tipo = new TipoBean();
		
		while(rs.next()){
			tipo.setId(rs.getInt("id"));
			tipo.setTipo(rs.getString("tipo"));
		}
		
		stmt.close();
		return tipo;
	}
	
}
