<%-- 
    Document   : form_alterar_servicos
    Created on : 18/11/2019, 16:32:49
    Author     : Administrador
--%>

<%@page import="modelo.Servicos"%>
<%@page import="modelo.ServicosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Servicos s = new Servicos();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ServicosDAO sDAO = new ServicosDAO();
        s = sDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <% String name = "Alterar Serviço";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner_dentista.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Alterar Servicos</h2>
            </div>
            <div class="row justify-content-center mb-4 mt-4">
                <form class="text-center" name="alterar_servicos" action="alterar_servicos.do?op=d" method="post">
                    <div class="form-row">
                        <div class="form-group col-sm-1">
                            <label for="hiddenId">ID:</label><%=s.getId()%>
                            <input type="hidden" id="hiddenId" value="<%=s.getId()%>" name="id"/>
                        </div>

                        <div class="form-group">
                            <label for="inputTipo"> Tipo de Serviço: </label>
                            <input type="text" class="form-control" id="inputTipo" name="nome" value="<%=s.getNome()%>" required />
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


