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
                    <form action="TarefaNovaServlet" method="post" class="">
                        <fieldset>
                            <legend>Nova Tarefa</legend>
                            <div class="control-group">
                                <label class="control-label" for="id-titulo">Titulo:</label>
                                <div class="controls">
                                    <input type="text" name="titulo" id="id-titulo" class="input-block-level" placeholder="Titulo" required>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="id-descricao">Descrição:</label>
                                <div class="controls">
                                    <textarea name="descricao" id="id-descricao" class="input-block-level" required></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label" for="id-atribuida">Atribuida:</label>
                                        <div class="controls">
                                            <select name="atribuida" id="id-atribuida" class="input-block-level">
                                                <c:forEach items="${usuarios}" var="u">
		                                        	<option value="${u.id}">${u.nome}</option>
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
		                                        	<option value="${t.id}">${t.tipo}</option>
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
                                            <select name="prioridade" id="id-prioridade" class="input-block-level">
                                                <option value="1">Alta</option>
                                                <option value="2">Normal</option>
                                                <option value="3">Baixa</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="control-group">
                                        <label class="control-label" for="id-prazo">Prazo <small>(em horas)</small>:</label>
                                        <div class="controls">
                                            <input type="number" name="prazo" id="id-prazo" class="input-block-level" placeholder="Prazo" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <a href="TarefasServlet" class="btn">Cancelar</a>
                                    <button type="submit" class="btn btn-primary pull-right"><i class="icon-pencil icon-white"></i> Criar</button>
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