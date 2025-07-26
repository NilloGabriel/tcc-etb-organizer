<%-- 
    Document   : form_inserir_menu
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Novo Menu";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Novo Menu</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="inserir_menu" action="inserir_menu.do" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-4">
                                <label for="inputTitulo"> Título: </label>
                                <input type="text" class="form-control" id="inputTitulo" placeholder="Título" name="titulo" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputLink"> Link: </label>
                                <input type="text" class="form-control" id="inputLink" placeholder="Link" name="link" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputIcone"> Ícone: </label>
                                <input type="text" class="form-control" id="inputIcone" placeholder="Ícone" name="icone" required />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-primary" value="Salvar"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
