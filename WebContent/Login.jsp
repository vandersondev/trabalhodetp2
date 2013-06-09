<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>Gerenciador de Tarefas</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Erro!</strong> Digite o usu�rio e senha corretamente.
            </div>
            <div class="form-login content">
                <form action="" method="post">
                    <fieldset>
                        <legend>Login</legend>
                        <input type="text" class="span4" name="email" id="emain" placeholder="E-mail">
                        <input type="password" class="span4" name="senha" id="senha" placeholder="Senha">
                        <button type="submit" class="btn btn-primary pull-right">Login</button>
                        <a href="#" class="cad pull-left">Cadastrar</a>
                    </fieldset>
                </form>
            </div>
    </div>
</body>
</html>