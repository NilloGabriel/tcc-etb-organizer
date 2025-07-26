<%-- 
    Document   : listar_cliente
    Created on : 02/11/2019, 16:31:44
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try {
        ClienteDAO pDAO = new ClienteDAO();
        lista = pDAO.listar();
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
            if (confirm("Tem certeza que deseja excluir o cliente:" + nome + "?")) {
                window.open("excluir_cliente.do?op=d&id=" + id, "_self");
            }
        }
    </script>
    <% String name = "Lista de Clientes";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    
    <body>
        <%@include file="banner_dentista.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Clientes</h2> 
            </div>
            <div class="pl-2">
                <a href="form_inserir_cliente_dentista.jsp" class="btn btn-primary mt-2 mb-2">Novo Cliente</a>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>                           
                            <th scope="col">CPF</th>                           
                            <th scope="col">Telefone</th>
                            <th scope="col">Email</th>                           
                            <th scope="col">Sexo</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                    for (Cliente c : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="ID"><%=c.getId()%></td>
                            <td data-label="Nome"><%=c.getNome()%> </td>                           
                            <td data-label="CPF"><%=c.getCpf()%></td>                          
                            <td data-label="Telefone"><%=c.getTelefone()%></td>
                            <td data-label="Email"><%=c.getEmail()%></td>                                   
                            <td data-label="Sexo"><%=c.getSexo()%></td>    
                            <td>
                                <a href="form_alterar_cliente_dentista.jsp?id=<%=c.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a> 
                                <a href="#" onclick="excluir('<%=c.getNome()%>',<%=c.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>                                                     
                            </td>
                    </tbody>         
                    <%
                        }
                    %>   
                </table>
            </div>
        </div>
    </body>
</html>