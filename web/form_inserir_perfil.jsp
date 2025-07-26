<%-- 
    Document   : form_inserir_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Novo Perfil";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Novo Perfil</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="inserir_perfil" action="inserir_perfil.do" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="inputNome"> Nome: </label>
                                <input type="text" class="form-control" id="inputNome" placeholder="Nome" name="nome" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputDescricao"> Descrição: </label>
                                <input type="text" class="form-control" id="inputDescricao" placeholder="Descriçao" name="descricao" required />
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
