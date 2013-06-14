<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.usuario == null }">
	<c:redirect url="Login.jsp" />
</c:if>

<c:import url="header.jsp"/> 
    <div class="container content">
        <div class="row">
            <c:import url="sidebar.jsp"/>
            <section class="span9">
            <c:if test="${requestScope.successDelete == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Tarefa excluida.
	            </div>
            </c:if>
            <c:if test="${requestScope.successCreated == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Tarefa Criada.
	            </div>
            </c:if>
            <c:if test="${requestScope.successEdited == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Tarefa Editada.
	            </div>
            </c:if>
                <div class="table-tasks">
                    <h3>Tarefas</h3>
                    <a href="NovaTarefaServlet" class="btn btn-primary btn-new-task"><i class="icon-pencil icon-white"></i> Nova tarefa</a>
                    <table class="table table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Titulo</th>
                                <th>Tipo</th>
                                <th>Atribuido</th>
                                <th>Prioridade</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tarefas}" var="t">
                            <c:choose>
                           	<c:when test="${t.prioridade == 1 }">
                           	<tr class="error">
                           	</c:when>
                           	<c:otherwise>
                           	<tr>
                           	</c:otherwise>
                            </c:choose>
                                <td><a href="TarefaServlet?id=${t.id }">${t.id }</a></td>
                                <td><a href="TarefaServlet?id=${t.id }">${t.titulo }</a></td>
                                <td><a href="TarefaServlet?id=${t.id }">${t.tipo.tipo}</a></td>
                                <td><a href="TarefaServlet?id=${t.id }">${t.atribuido.nome}</a></td>
                                <td><a href="TarefaServlet?id=${t.id }">
                                <c:choose>
                                	<c:when test="${t.prioridade == 1 }">
                                	<span class="label label-important">Alta</span>
                                	</c:when>
                                	<c:when test="${t.prioridade == 2 }">
                                	<span class="label label-warning">Normal</span>
                                	</c:when>
                                	<c:when test="${t.prioridade == 3 }">
                                	<span class="label label-info">Baixa</span>
                                	</c:when>
                                </c:choose>
                                	</a>
                                
                                </td>
                                <td>
                                <c:choose>
                                	<c:when test="${t.status == 1 }">
                                	<a href="TarefaServlet?id=${t.id }" class="text-error">Pendente</a>
                                	</c:when>
                                	<c:when test="${t.status == 2 }">
                                	<a href="TarefaServlet?id=${t.id }" class="text-warning">Fazendo</a>
                                	</c:when>
                                	<c:when test="${t.status == 3 }">
                                	<a href="TarefaServlet?id=${t.id }" class="text-info">Feito</a>
                                	</c:when>
                                </c:choose>
                                </td>
                                <td>
                                    <a href="EditarTarefaServlet?id=${t.id }" class="btn"><i class="icon-edit"></i> Editar</a>
                    				<a href="ExcluirTarefaServlet?id=${t.id }" class="btn btn-danger"><i class="icon-trash icon-white"></i> Excluir</a>
                                </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                    </table>
                    <a href="NovaTarefaServlet" class="btn btn-primary btn-new-task"><i class="icon-pencil icon-white"></i> Nova tarefa</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>