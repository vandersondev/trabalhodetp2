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
                <div class="table-tasks">
                    <form action="TarefaEditarServlet" method="post" class="">
                    <input type="hidden" name="idtarefa" value="${tarefa.id }">
                        <fieldset>
                            <legend>Editar Tarefa</legend>
                            <div class="control-group">
                                <label class="control-label" for="id-titulo">Titulo:</label>
                                <div class="controls">
                                    <input type="text" name="titulo" id="id-titulo" class="input-block-level" placeholder="Titulo" value="${tarefa.titulo }" required>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="id-descricao">Descrição:</label>
                                <div class="controls">
                                    <textarea name="descricao" id="id-descricao" class="input-block-level" required>${tarefa.descricao }</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label" for="id-atribuida">Atribuida:</label>
                                        <div class="controls">
                                            <select name="atribuida" id="id-atribuida" class="input-block-level">
                                                <c:forEach items="${usuarios}" var="u">
                                                <c:choose>
	                                                <c:when test="${u.id == tarefa.atribuido.id }">
			                                        	<option value="${u.id}" selected>${u.nome}</option>
		                                        	</c:when>
		                                        	<c:otherwise>
			                                       		<option value="${u.id}">${u.nome}</option>
			                                       	</c:otherwise>
	                                        	</c:choose>
		                                        </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="control-group">
                                        <label class="control-label" for="id-tipo">Tipo:</label>
                                        <div class="controls">
                                            <select name="tipo" id="id-tipo" class="input-block-level">
                                                <c:forEach items="${tipos}" var="t">
                                                <c:choose>
                                                <c:when test="${t.id == tarefa.tipo.id }">
		                                        	<option value="${t.id}" selected>${t.tipo}</option>
		                                       	</c:when>
		                                       	<c:otherwise>
		                                       	<option value="${t.id}">${t.tipo}</option>
		                                       	</c:otherwise>
		                                       	</c:choose>
		                                        </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span3">
                                    <div class="control-group">
                                        <label class="control-label" for="id-prioridade">Prioridade:</label>
                                        <div class="controls">
                                            <select name="prioridade" id="id-prioridade" class="input-block-level">\
                                                <option value="1" ${tarefa.prioridade == 1 ? "selected": "" }>Alta</option>
                                                <option value="2" ${tarefa.prioridade == 2 ? "selected": "" }>Normal</option>
                                                <option value="3" ${tarefa.prioridade == 3 ? "selected": "" }>Baixa</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="control-group">
                                        <label class="control-label" for="id-prazo">Prazo <small>(em horas)</small>:</label>
                                        <div class="controls">
                                            <input type="number" name="prazo" id="id-prazo" class="input-block-level" placeholder="Prazo" value="${tarefa.prazo }" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="id-status">Status:</label>
                                <div class="controls">
                                    <select name="status" id="id-status" class="input-span3">
                                        <option value="1" ${tarefa.status == 1 ? "selected" : "" }>Pendente</option>
                                        <option value="2" ${tarefa.status == 2 ? "selected" : "" }>Fazendo</option>
                                        <option value="3" ${tarefa.status == 3 ? "selected" : "" }>Feito</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <a href="TarefasServlet" class="btn">Cancelar</a>
                                    <button type="submit" class="btn btn-primary pull-right"><i class="icon-pencil icon-white"></i> Editar</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </section>
        </div>
    </div>
</body>
</html>