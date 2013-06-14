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
                    <h3>Mensagem</h3>
                    <div class="info-task well well-large">
                        <dl class="dl-horizontal">
                            <dt>De</dt>
                            <dd>${mensagem.de.nome }</dd>
                            <dt>Assunto</dt>
                            <dd>${mensagem.assunto }</dd>
                            <dt>Mensagem</dt>
                            <dd>${mensagem.mensagem }</dd>
                        </dl>
                    </div>
                    <a href="MensagemExcluirServlet?id_mensagem=${mensagem.id }" class="btn btn-danger"><i class="icon-trash icon-white"></i> Excluir</a>
                </div>
            </section>
        </div>
    </div>
</body>
</html>