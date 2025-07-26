<%-- 
    Document   : inserir_servico
    Created on : 18/11/2019, 16:18:32
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Novo Serviço";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    
    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Novo Serviço</h2>
            </div>

            <div class="row justify-content-center mb-4 mt-4">
                <form class="text-center" name="inserir_servico" action="inserir_servico.do?op=c" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="inputTipo"> Tipo de Serviço: </label>
                            <input type="text" class="form-control" id="inputTipo" placeholder="Serviço" name="nome" required />
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
    </body>
</html>

