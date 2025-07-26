<%-- 
    Document   : login_dentista
    Created on : 24/11/2019, 11:10:54
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="IOOG - Dental: Implantes e Manuntenções">
        <meta name="keywords" content="Clinic, Dental, Odonto">
        <meta name="author" content="Noiz 5 Mesmo">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Acesso Restrito - Organizer</title>

        <link rel = "shortcut icon" type = "imagem/x-icon" href = "imagens/logo_branca_icon.ico"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/login_dentista.css" rel="stylesheet" type="text/css"/>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/all.min.js" type="text/javascript"></script>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                            <img src="imagens/logo_branca.jpg" class="brand_logo" alt="organizer">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form_container">
                        <form name="login" action="valida_login_dentista.do" method="post">
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" name="login" class="form-control input_user" placeholder="Usuário" required>
                            </div>
                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" name="senha" class="form-control input_pass" placeholder="Senha" required>
                            </div>

                            <div class="d-flex justify-content-center mt-3 login_container">
                                <input type="submit" name="button" class="btn login_btn" value="Login">
                            </div>                                                      
                        </form> 
                    </div>
                    <form name="login" action="login.jsp" method="post">
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <input type="submit" name="button" class="btn btn-danger" value="Ir para Login Funcionário">
                        </div>
                    </form>
                </div>
            </div>
        </div>       
    </body>
</html>