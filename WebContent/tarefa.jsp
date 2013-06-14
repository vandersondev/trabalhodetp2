<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${sessionScope.usuario == null }">
	<c:redirect url="Login.jsp" />
</c:if>

<c:import url="header.jsp"/> 
    <div class="container content">
        <div class="row">
            <c:import url="sidebar.jsp"/>
            <section class="span9">
                <div class="table-tasks">
                    <h3>Tarefa</h3>
                    <div class="info-task well well-large">
                        <dl class="dl-horizontal">
                            <dt>Titulo</dt>
                            <dd>${tarefa.titulo }</dd>
                            <dt>Descrição</dt>
                            <dd>${tarefa.descricao }</dd>
                            <dt>Atribuido</dt>
                            <dd>${tarefa.atribuido.nome }</dd>
                            <dt>Criada por</dt>
                            <dd>${tarefa.criadapor.nome }</dd>
                            <dt>Tipo</dt>
                            <dd>${tarefa.tipo.tipo }</dd>
                            <dt>Prioridade</dt>
                            <dd>
                            <c:choose>
                            	<c:when test="${tarefa.prioridade == 1 }">
                            	<span class="label label-important">Alta</span>
                            	</c:when>
                            	<c:when test="${tarefa.prioridade == 2 }">
                            	<span class="label label-warning">Normal</span>
                            	</c:when>
                            	<c:when test="${tarefa.prioridade == 3 }">
                            	<span class="label label-info">Baixa</span>
                            	</c:when>
                            </c:choose>
                            </dd>
                            <dt>Status</dt>
                            <dd>
                            <c:choose>
                            	<c:when test="${tarefa.status == 1 }">
                            	<span class="text-error">Pendente</span>
                            	</c:when>
                            	<c:when test="${tarefa.status == 2 }">
                            	<span class="text-warning">Fazendo</span>
                            	</c:when>
                            	<c:when test="${tarefa.status == 3 }">
                            	<span class="text-info">Feito</span>
                            	</c:when>
                            </c:choose>
                            </dd>
                            <dt>Data de Criação</dt>
                            <dd>
                            	
                            	<fmt:formatDate value="${tarefa.dataCriacao.time}" pattern="dd/MM/yyyy" />
                            </dd>
                            <dt>Prazo <small>(em horas)</small></dt>
                            <dd>8</dd>
                        </dl>
                    </div>
                    <a href="EditarTarefaServlet?id=${tarefa.id }" class="btn"><i class="icon-edit"></i> Editar</a>
                    <a href="ExcluirTarefaServlet?id=${tarefa.id }" class="btn btn-danger"><i class="icon-trash icon-white"></i> Excluir</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>