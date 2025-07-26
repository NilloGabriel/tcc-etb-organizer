<%-- 
    Document   : listar_dentista
    Created on : 07/11/2019, 21:40:28
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Dentista"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DentistaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Dentista> lista = new ArrayList<Dentista>();
    try {
        DentistaDAO dDAO = new DentistaDAO();
        lista = dDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<html>

    <script type="text/javascript">
        function excluir(nome, id) {
            if (confirm("Tem certeza que deseja excluir o dentista:" + nome + "?")) {
                window.open("excluir_dentista.do?op=c&id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Dentistas";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Dentistas</h2>
            </div>
            <div class="pl-2">
                <a href="form_inserir_dentista.jsp" class="btn btn-primary mt-2 mb-2">Novo Dentista</a>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>                         
                            <th scope="col">CPF</th>                           
                            <th scope="col">CFO</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">Email</th>                          
                            <th scope="col">Sexo</th>
                            <th scope="col">Login</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                for (Dentista d : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="ID"><%=d.getId()%></td>
                            <td data-label="Nome"><%=d.getNome()%> </td>                           
                            <td data-label="CPF"><%=d.getCpf()%></td>
                            <td data-label="CFO"><%=d.getCfo()%> </td>                          
                            <td data-label="Telefone"><%=d.getTelefone()%></td>
                            <td data-label="Email"><%=d.getEmail()%></td>                          
                            <td data-label="Sexo"><%=d.getSexo()%></td>
                            <td data-label="Login"><%=d.getLogin()%></td>  
                            <td>
                                <a href="form_alterar_dentista.jsp?id=<%=d.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a>
                                <a href="#" onclick="excluir('<%=d.getNome()%>',<%=d.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a> 
                            </td>
                        </tr>            
                        <%
                            }
                        %> 
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
