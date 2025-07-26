<%-- 
    Document   : listar_servicos
    Created on : 18/11/2019, 16:14:18
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ServicosDAO"%>
<%@page import="modelo.Servicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Servicos> lista = new ArrayList<Servicos>();
    try {
        ServicosDAO sDAO = new ServicosDAO();
        lista = sDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<html>
    <script type="text/javascript">
        function excluir(nome, id) {
            if (confirm("Tem certeza que deseja excluir o serviço:" + nome + "?")) {
                window.open("excluir_servico.do?id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Serviços";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner_dentista.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Serviços</h2>
            </div>
            <div class="pl-2">
                <a href="form_inserir_servicos_dentista.jsp" class="btn btn-primary mt-2 mb-2">Novo Serviço</a>
            </div>
            <div class="table-responsive">
            <table class="table table-sm table-hover">
                <thead class="thead-dark text-center">
                <tr>
                    <th scope="row"></th>
                    <th scope="col">ID</th>
                    <th scope="col">Tipo de Serviço</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <%                    for (Servicos s : lista) {
                %>
                <tbody class="text-center">
                <tr>
                    <th scope="row"></th>
                    <td data-label="ID"><%=s.getId()%></td>
                    <td data-label="Nome"><%=s.getNome()%></td>
                    <td>
                        <a href="form_alterar_servicos_dentista.jsp?id=<%=s.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a> 
                        <a href="#" onclick="excluir('<%=s.getNome()%>',<%=s.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
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