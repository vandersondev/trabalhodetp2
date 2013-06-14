<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"/>
    <div class="container">
    <c:if test="${requestScope.existUser == 1}">
      <div class="alert alert-error">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Erro!</strong> E-mail já cadastrado.
      </div>
     </c:if>
        <div class="form-cad content">
            <form action="CadastroServlet" method="post" class="form-horizontal">
                <fieldset>
                    <legend>Cadastro</legend>
                    <div class="control-group">
                        <label class="control-label" for="id-nome">Nome:</label>
                        <div class="controls">
                            <input type="text" name="nome" id="id-nome" class="input-block-level" placeholder="Nome" required>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="id-email">E-mail:</label>
                        <div class="controls">
                            <input type="text" name="email" id="id-email" class="input-block-level" placeholder="E-mail" required pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="id-senha">Senha:</label>
                        <div class="controls">
                            <input type="password" name="senha" id="id-senha" class="input-block-level" placeholder="Senha" required max="6" min="2">
                            <span class="help-block">Ate 6 caractéres.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <a href="Login.jsp" class="btn">Cancelar</a>
                            <button type="submit" class="btn btn-primary pull-right">Cadastrar</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>