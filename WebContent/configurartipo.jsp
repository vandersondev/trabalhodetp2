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
	                <strong>Viva!</strong> Usuario excluido.
	            </div>
            </c:if>
            <c:if test="${requestScope.successAdmin == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Administrador criado.
	            </div>
            </c:if>
            <ul class="nav nav-tabs">
			  <li>
			    <a href="ConfiguracoesServlet">Usuários</a>
			  </li>
			  <li class="active"><a href="ConfiguracoesTiposServlet">Tipos</a></li>
			</ul>
                <div class="table-tasks">
                    <h3>Configurações</h3>
                    <div class="table-tasks">
                    <form action="ConfiguracoesNovoTipoServlet" method="post" class="form-inline">
                        <fieldset>
                            <legend>Novo tipo</legend>
                            <input type="text" name="tipo" id="id-tipo" class="input-xxlarge" placeholder="Tipo" required>
                            <button type="submit" class="btn btn-primary pull-right"><i class="icon-pencil icon-white"></i> Enviar</button>
                        </fieldset>
                    </form>
                </div>
                    <table class="table table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Usuario</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tipos}" var="t">
                            <tr>
                                <td>${t.id }</td>
                                <td>${t.tipo }</td>
                                <td>
                                    <a href="ExcluirTipoServlet?id=${t.id}" class="btn btn-danger"><i class="icon-trash icon-white"></i> Excluir</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
</body>
</html>