package br.com.fiap.si.tp2.trabalho.bean;

public class MensagemBean {
	
	private Integer id;
	private UsuarioBean de;
	private UsuarioBean para;
	private String mensagem;
	private String assunto;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public UsuarioBean getDe() {
		return de;
	}
	public void setDe(UsuarioBean de) {
		this.de = de;
	}
	public UsuarioBean getPara() {
		return para;
	}
	public void setPara(UsuarioBean para) {
		this.para = para;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

}
