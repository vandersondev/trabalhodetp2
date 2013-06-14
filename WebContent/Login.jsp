<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"/> 
    <div class="container">
    		<c:if test="${requestScope.sessionBlock == 1}">
	            <div class="alert alert-warning">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Aviso!</strong> Efetue Login ou <a href="Cadastro.jsp">cadastre-se</a> para utilizar o sistema.
	            </div>
            </c:if>
    		<c:if test="${requestScope.error == 1}">
	            <div class="alert alert-error">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Erro!</strong> Digite o usuário e senha corretamente.
	            </div>
            </c:if>
            <c:if test="${requestScope.sign == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Usuário cadastrado com sucesso, efetue o login para utilizar o sistema.
	            </div>
            </c:if>
            <div class="form-login content">
                <form action="LoginServlet" method="post">
                    <fieldset>
                        <legend>Login</legend>
                        <input type="text" class="span4" name="email" id="id-emain" placeholder="E-mail" required pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$">
                        <input type="password" class="span4" name="senha" id="id-senha" placeholder="Senha" required max="6" min="2">
                        <button type="submit" class="btn btn-primary pull-right">Login</button>
                        <a href="Cadastro.jsp" class="cad pull-left">Cadastrar</a>
                    </fieldset>
                </form>
            </div>
    </div>
</body>
</html>