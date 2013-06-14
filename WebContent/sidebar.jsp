<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<aside class="span3 nav-service">
                <ul>
                    <li><a href="IndexServlet">Iní­cio</a></li>
                    <li><a href="NovaTarefaServlet">Nova tarefa</a></li>
                    <li><a href="TarefasServlet">Tarefas</a></li>
                    <li><a href="MensagemNovaServlet">Nova mensagem</a></li>
                    <li><a href=MensagensServlet>Mensagens</a></li>
                    <c:if test="${sessionScope.usuario.isAdmin == 1}">
                    	<li><a href="ConfiguracoesServlet">Configurações</a></li>
                    </c:if>
                </ul>
            </aside>