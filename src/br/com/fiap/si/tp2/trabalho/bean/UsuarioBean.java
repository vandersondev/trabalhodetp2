package br.com.fiap.si.tp2.trabalho.bean;

public class UsuarioBean {
	
	private String nome;
	private String email;
	private String senha;
	private String isAdmin;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.senha = isAdmin;
	}
	
}
