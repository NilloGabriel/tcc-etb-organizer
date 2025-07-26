<%-- 
    Document   : listar_menu
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Menu> lista = new ArrayList<Menu>();
    try {
        MenuDAO mDAO = new MenuDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<html>
    <script type="text/javascript">
        function excluir(titulo, id) {
            if (confirm("Tem certeza que deseja excluir o menu:" + titulo + "?")) {
                window.open("excluir_menu.do?id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Menus";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Menus</h2>
            </div>
            <div class="pl-2">
                <a href="form_inserir_menu.jsp" class="btn btn-primary mt-2 mb-2">Novo Menu</a>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center ">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Título</th>
                            <th scope="col">Link</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                    for (Menu m : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="ID"><%=m.getId()%></td>
                            <td data-label="Título"><%=m.getTitulo()%></td>
                            <td data-label="Ícone"><%=m.getLink()%></td>
                            <td>
                                <a href="form_alterar_menu.jsp?id=<%=m.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a> 
                                <a href="#" onclick="excluir('<%=m.getTitulo()%>',<%=m.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr> 
                    </tbody>
                    <%
                        }
                    %>   
                </table>
            </div>
        </div>
    </body>
</html>
