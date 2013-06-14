package br.com.fiap.si.tp2.trabalho.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.si.tp2.trabalho.bean.TarefaBean;
import br.com.fiap.si.tp2.trabalho.bean.UsuarioBean;
import br.com.fiap.si.tp2.trabalho.dao.TarefaDAO;
import br.com.fiap.si.tp2.trabalho.dao.TipoDAO;
import br.com.fiap.si.tp2.trabalho.dao.UsuarioDAO;

/**
 * Servlet implementation class TarefaEditarServlet
 */
@WebServlet("/TarefaEditarServlet")
public class TarefaEditarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TarefaEditarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
   	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		req(request, response);
   	}

   	/**
   	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		req(request, response);
   	}
   	
   	protected void req(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		
   		HttpSession session = request.getSession(true);
   		UsuarioBean user = (UsuarioBean) session.getAttribute("usuario");
   		
   		String page = null;
   		
   		if(user == null) {
   			page = "Login.jsp";
   			request.setAttribute("sessionBlock", 1);
   		} else {
   			
   			
   			String titulo = request.getParameter("titulo");
   			String descricao = request.getParameter("descricao");
   			int id = Integer.parseInt(request.getParameter("idtarefa"));
   			int atribuida = Integer.parseInt(request.getParameter("atribuida"));
   			int tipo = Integer.parseInt(request.getParameter("tipo"));
   			int status = Integer.parseInt(request.getParameter("status"));
   			int prioridade = Integer.parseInt(request.getParameter("prioridade"));
   			int prazo = Integer.parseInt(request.getParameter("prazo"));
   			
   			page = "TarefasServlet";
   			TarefaBean tarefa = new TarefaBean();
   			TarefaDAO tarefaDao = new TarefaDAO();
   			UsuarioDAO usuarioDao = new UsuarioDAO();
   			TipoDAO tipoDao = new TipoDAO();
   			
   			tarefa.setId(id);
   			tarefa.setTitulo(titulo);
   			tarefa.setDescricao(descricao);
   			try {
				tarefa.setAtribuido(usuarioDao.getUsuario(atribuida));
				tarefa.setTipo(tipoDao.getTipo(tipo));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
   			tarefa.setStatus(status);
   			tarefa.setPrioridade(prioridade);
   			tarefa.setPrazo(prazo);
   			tarefa.setCriadapor(user);
   			tarefa.setDataCriacao(Calendar.getInstance());
   			
   			tarefaDao.editarTarefa(tarefa);

			request.setAttribute("successEdited", 1);
   			
   			
   		}
   		
   		
   		
   		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
   		dispatcher.forward(request, response);
   		
   	}

}
