<%-- 
    Document   : form_alterar_menu
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Menu m = new Menu();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO mDAO = new MenuDAO();
        m = mDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <% String name = "Alterar Menu";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Alterar Menu</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="alterar_menu" action="alterar_menu.do" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-1">
                                <label for="hiddenId">ID:</label><%=m.getId()%>
                                <input type="hidden" id="hiddenId" value="<%=m.getId()%>" name="id"/>
                            </div>
                            
                            <div class="form-group col-sm-4">
                                <label for="inputTitulo"> Título: </label>
                                <input type="text" class="form-control" id="inputTitulo" name="titulo" value="<%=m.getTitulo()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-4">
                                <label for="inputLink"> Link: </label>
                                <input type="text" class="form-control" id="inputLink" name="link" value="<%=m.getLink()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-3">
                                <label for="inputIcone"> Ícone: </label>
                                <input type="text" class="form-control" id="inputIcone" name="icone" value="<%=m.getIcone()%>" required />
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
