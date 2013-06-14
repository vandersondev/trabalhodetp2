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
            <c:if test="${requestScope.successSend == 1}">
	            <div class="alert alert-success">
	                <button type="button" class="close" data-dismiss="alert">&times;</button>
	                <strong>Viva!</strong> Mensagem enviada.
	            </div>
            </c:if>
                <div class="table-tasks">
                    <h3>Mensagens</h3>
                    <a href="MensagemNovaServlet" class="btn btn-primary btn-new-task"><i class="icon-pencil icon-white"></i> Nova mensagem</a>
                    <table class="table table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>De</th>
                                <th>Assunto</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${mensagens}" var="m">
                            <tr>
                                <td><a href="MensagemServlet?id_mensagem=${m.id }">${m.de.nome}</a></td>
                                <td><a href="MensagemServlet?id_mensagem=${m.id }">${m.assunto }</a></td>
                                <td>
                                    <a href="MensagemExcluirServlet?id_mensagem=${m.id }" class="btn btn-danger"><i class="icon-trash icon-white"></i> Excluir</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <a href="MensagemNovaServlet" class="btn btn-primary btn-new-task"><i class="icon-pencil icon-white"></i> Nova mensagem</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>