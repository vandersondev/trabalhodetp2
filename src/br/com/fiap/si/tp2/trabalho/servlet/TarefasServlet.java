package br.com.fiap.si.tp2.trabalho.servlet;

import java.io.IOException;
import java.util.ArrayList;

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

/**
 * Servlet implementation class TarefasServlet
 */
@WebServlet("/TarefasServlet")
public class TarefasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TarefasServlet() {
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
			
			page = "tarefas.jsp";
			
			TarefaDAO tarefaDao = new TarefaDAO();
			ArrayList<TarefaBean> tarefas = tarefaDao.getTarefas(false);
			request.setAttribute("tarefas", tarefas);
				
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
		
	}

}
