package br.com.fiap.si.tp2.trabalho.bean;

import java.util.Calendar;

public class TarefaBean {
	
	private int id;
	private String titulo;
	private String descricao;
	private Calendar dataCriacao;
	private int prazo;
	private TipoBean tipo;
	private int prioridade;
	private int status;
	private UsuarioBean atribuido;
	private UsuarioBean criadapor;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Calendar getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Calendar dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public int getPrazo() {
		return prazo;
	}
	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}
	public TipoBean getTipo() {
		return tipo;
	}
	public void setTipo(TipoBean tipo) {
		this.tipo = tipo;
	}
	public int getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public UsuarioBean getAtribuido() {
		return atribuido;
	}
	public void setAtribuido(UsuarioBean atribuido) {
		this.atribuido = atribuido;
	}
	public UsuarioBean getCriadapor() {
		return criadapor;
	}
	public void setCriadapor(UsuarioBean criadapor) {
		this.criadapor = criadapor;
	}
	
	
}
