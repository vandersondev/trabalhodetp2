<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="ISO-8859-1">
    <title>Gerenciador de Tarefas</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="form-cad content">
            <form action="" method="post" class="form-horizontal">
                <fieldset>
                    <legend>Cadastro</legend>
                    <div class="control-group">
                        <label class="control-label" for="nome">Nome:</label>
                        <div class="controls">
                            <input type="text" name="nome" id="nome" class="input-block-level" placeholder="Nome">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="sobrenome">Sobrenome:</label>
                        <div class="controls">
                            <input type="text" name="sobrenome" id="sobrenome" class="input-block-level" placeholder="Sobrenome">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="email">E-mail:</label>
                        <div class="controls">
                            <input type="text" name="email" id="email" class="input-block-level" placeholder="E-mail">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="senha">Senha:</label>
                        <div class="controls">
                            <input type="password" name="senha" id="senha" class="input-block-level" placeholder="Senha">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="button" class="btn">Cancelar</button>
                            <button type="submit" class="btn btn-primary pull-right">Cadastrar</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>