<%-- 
    Document   : listar_funcionario
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
    try {
        FuncionarioDAO fDAO = new FuncionarioDAO();
        lista = fDAO.listar();
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
            if (confirm("Tem certeza que deseja excluir o usuário:" + nome + "?")) {
                window.open("excluir_funcionario.do?op=d&id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Funcionários";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner_dentista.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Funcionários</h2>
            </div>
            <div class="pl-2">
                <a href="form_inserir_funcionario_dentista.jsp" class="btn btn-primary mt-2 mb-2">Novo Funcionário</a>
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
                            <th scope="col">Login</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                for (Funcionario f : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="ID"><%=f.getId()%></td>
                            <td data-label="Nome"><%=f.getNome()%> </td>                         
                            <td data-label="CPF"><%=f.getCpf()%></td>                          
                            <td data-label="Telefone"><%=f.getTelefone()%></td>
                            <td data-label="Email"><%=f.getEmail()%></td>                         
                            <td data-label="Sexo"><%=f.getSexo()%></td>
                            <td data-label="Login"><%=f.getLogin()%></td>  
                            <td>
                                <a href="form_alterar_funcionario_dentista.jsp?id=<%=f.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i></a> 
                                <a href="#" onclick="excluir('<%=f.getNome()%>',<%=f.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
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

