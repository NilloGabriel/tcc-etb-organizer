<%-- 
    Document   : listar_perfil
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try {
        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<html>
    <script type="text/javascript">
        function excluir(nome, id) {
            if (confirm("Tem certeza que deseja excluir o perfil:" + nome + "?")) {
                window.open("excluir_perfil1.do?id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Perfis";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Perfis</h2>
            </div>
            <div class="pl-2">
                <a href="form_inserir_perfil.jsp" class="btn btn-primary mt-2 mb-2">Novo Perfil</a>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                for (Perfil p : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="ID"><%=p.getId()%></td>
                            <td data-label="Nome"><%=p.getNome()%></td>
                            <td>
                                <a href="form_alterar_perfil.jsp?id=<%=p.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a> 
                                <a href="#" onclick="excluir('<%=p.getNome()%>',<%=p.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a> 
                                <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId()%>" class="btn btn-info btn-sm"><i class="fas fa-tasks"></i></a>
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