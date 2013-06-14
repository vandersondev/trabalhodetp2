package br.com.fiap.si.tp2.trabalho.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import br.com.fiap.si.tp2.trabalho.bean.TarefaBean;
import br.com.fiap.si.tp2.trabalho.bean.TipoBean;
import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.factory.ConnectionFactory;

public class TarefaDAO {
	
	private Connection connection;
	private String sqlListTarefas = "SELECT * FROM tarefa";
	private String sqlGetTarefa = "SELECT * FROM tarefa WHERE id = ?";
	private String sqlDeleteTarefa = "DELETE FROM tarefa WHERE id= ?";
	private String sqlInsertTarefa = "INSERT INTO tarefa (titulo, descricao, data_criacao, prazo, idtipo, prioridade, status, atribuido, criadapor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private String sqlUpdateTarefa = "UPDATE tarefa SET titulo = ?, descricao = ?, prazo = ?, prioridade = ?, status = ?, atribuido = ?, idtipo = ? WHERE id = ?";
	
	public TarefaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void editarTarefa(TarefaBean tarefa) {
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlUpdateTarefa);
			stmt.setString(1, tarefa.getTitulo());
			stmt.setString(2, tarefa.getDescricao());
			stmt.setInt(3, tarefa.getPrazo());
			stmt.setInt(4, tarefa.getPrioridade());
			stmt.setInt(5, tarefa.getStatus());
			stmt.setInt(6, tarefa.getAtribuido().getId());
			stmt.setInt(7, tarefa.getTipo().getId());
			stmt.setInt(8, tarefa.getId());
			
			
			stmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void novaTarefa(TarefaBean tarefa) {
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlInsertTarefa);
			stmt.setString(1, tarefa.getTitulo());
			stmt.setString(2, tarefa.getDescricao());
			
			Date dataParaGravar = new Date(tarefa.getDataCriacao().getTimeInMillis());
			stmt.setDate(3, dataParaGravar);
			
			stmt.setInt(4, tarefa.getPrazo());
			stmt.setInt(5, tarefa.getTipo().getId());
			stmt.setInt(6, tarefa.getPrioridade());
			stmt.setInt(7, 1);
			stmt.setInt(8, tarefa.getAtribuido().getId());
			stmt.setInt(9, tarefa.getCriadapor().getId());
			
			
			stmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void deletaTarefa(int id) throws SQLException {
		
		PreparedStatement stmt = this.connection.prepareStatement(sqlDeleteTarefa);
		stmt.setInt(1, id);
		stmt.execute();
	}
	
	public TarefaBean getTarefa(int id) {
		
		TarefaBean tarefa = new TarefaBean();
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlGetTarefa);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
	
			TipoDAO tipoDao = new TipoDAO();
			UsuarioDAO usuarioDao = new UsuarioDAO();
			
			while(rs.next()){
				
				TipoBean tipo = tipoDao.getTipo(rs.getInt("idtipo"));
				UsuarioBean atribuido = usuarioDao.getUsuario(rs.getInt("atribuido"));
				UsuarioBean criadapor = usuarioDao.getUsuario(rs.getInt("criadapor"));
				
				

				Calendar data_criacao = Calendar.getInstance();
				
				data_criacao.setTime(rs.getDate("data_criacao"));
				
				tarefa.setId(rs.getInt("id"));
				tarefa.setTitulo(rs.getString("titulo"));
				tarefa.setDescricao(rs.getString("descricao"));
				
				tarefa.setDataCriacao(data_criacao);
				tarefa.setPrazo(rs.getInt("prazo"));
				
				tarefa.setTipo(tipo);
				
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setStatus(rs.getInt("status"));
				tarefa.setAtribuido(atribuido);
				tarefa.setCriadapor(criadapor);
				
			}
			
			stmt.close();
			
			return tarefa;
		
		} catch (SQLException e) {
			throw new RuntimeException(e);	
		}
		
	} 
	
	public ArrayList<TarefaBean> getTarefas(boolean limite) {
		
		if (limite) {
			this.sqlListTarefas += " LIMIT 5";
		}
		
		ArrayList<TarefaBean> tarefas = new ArrayList<TarefaBean>();
		PreparedStatement stmt;
		try {
			stmt = this.connection.prepareStatement(sqlListTarefas);
		
			ResultSet rs = stmt.executeQuery();
	
			TarefaBean tarefa = null;
			TipoDAO tipoDao = new TipoDAO();
			UsuarioDAO usuarioDao = new UsuarioDAO();
			
			while(rs.next()){
				tarefa = new TarefaBean();
				
				TipoBean tipo = tipoDao.getTipo(rs.getInt("idtipo"));
				UsuarioBean atribuido = usuarioDao.getUsuario(rs.getInt("atribuido"));
				UsuarioBean criadapor = usuarioDao.getUsuario(rs.getInt("criadapor"));
				
				

				Calendar data_criacao = Calendar.getInstance();
				
				data_criacao.setTime(rs.getDate("data_criacao"));
				
				tarefa.setId(rs.getInt("id"));
				tarefa.setTitulo(rs.getString("titulo"));
				tarefa.setDescricao(rs.getString("descricao"));
				
				tarefa.setDataCriacao(data_criacao);
				tarefa.setPrazo(rs.getInt("prazo"));
				
				tarefa.setTipo(tipo);
				
				tarefa.setPrioridade(rs.getInt("prioridade"));
				tarefa.setStatus(rs.getInt("status"));
				tarefa.setAtribuido(atribuido);
				tarefa.setCriadapor(criadapor);
				
				tarefas.add(tarefa);
				
			}
			
			stmt.close();
			
			return tarefas;
		
		} catch (SQLException e) {
			throw new RuntimeException(e);	
		}
		
	} 
	
	
}
