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
                    <form action="MensagemSendServlet" method="post" class="">
                        <fieldset>
                            <legend>Nova Mensagem</legend>
                            <div class="control-group">
                                <label class="control-label" for="id-assunto">Assunto:</label>
                                <div class="controls">
                                    <input type="text" name="assunto" id="id-assunto" class="input-block-level" placeholder="Titulo" required>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="id-destinatario">Destinatario:</label>
                                <div class="controls">
                                    <select name="destinatario" id="id-destinatario" class="input-block-level">
                                        <c:forEach items="${usuarios}" var="u">
                                        	<option value="${u.id}">${u.nome}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="id-mensagem">Mensagem:</label>
                                <div class="controls">
                                    <textarea name="mensagem" id="id-mensagem" class="input-block-level" required></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <a href="MensagensServlet" class="btn">Cancelar</a>
                                    <button type="submit" class="btn btn-primary pull-right"><i class="icon-pencil icon-white"></i> Enviar</button>
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