<%-- 
    Document   : listar_consulta
    Created on : 20/08/2019, 16:31:21
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.ConsultaDAO"%>
<%@page import="modelo.Consulta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Consulta> lista = new ArrayList<Consulta>();
    try {
        ConsultaDAO cDAO = new ConsultaDAO();
        lista = cDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<%
    SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat hr = new SimpleDateFormat("HH:mm");


%>
<html>

    <script type="text/javascript">
        function excluir(data_consulta, id) {
            if (confirm("Tem certeza que deseja excluir a consulta do dia:" + data_consulta + "?")) {
                window.open("excluir_consulta.do?op=c&id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Consultas";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Lista de Consultas</h2>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">ID</th>
                            <th scope="col">Data da Consulta</th>
                            <th scope="col">Hora da Consulta</th>
                            <th scope="col">Tipo de Serviço</th>
                            <th scope="col">Médico a Atender</th>
                            <th scope="col">Para o Cliente</th>
                            <th scope="col">Funcionário que Marcou</th>
                            <th scope="col">Status </th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <%                    for (Consulta c : lista) {
                    %>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td><%=c.getId()%></td>
                            <td><%=sd.format(c.getData_consulta())%></td>
                            <td><%=hr.format(c.getHora_consulta())%> horas</td>
                            <td><%=c.getServicos().getNome()%></td>
                            <td><%=c.getDentista().getNome()%></td>
                            <td><%=c.getCliente().getNome()%></td>
                            <td><%=c.getFuncionario().getNome()%></td>
                            <td align="center">
                                <%
                                    if (c.getStatus_consulta() == null) {
                                %>
                                <a href="status_comparecimento.jsp?id=<%=c.getId()%>"><i class="far fa-check-circle"></i></a>
                                    <%
                                    } else if (c.getStatus_consulta().equals("compareceu")) {
                                    %>
                                <a href=""><i class="fas fa-check-circle"></i></a>
                                    <%
                                    } else if (c.getStatus_consulta().equals("ausente")) {
                                    %>
                                <a href=""><i class="fas fa-times-circle"></i></a>
                                    <%
                                        }
                                    %>
                            </td>
                            <td><a href="form_alterar_consulta.jsp?id=<%=c.getId()%>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt"></i> </a> 
                                <a href="#" onclick="excluir('<%=c.getData_consulta()%>',<%=c.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                                    <%
                                        if (c.getPagou() == null) {
                                    %>
                                <a href="form_pagamento.jsp?id=<%=c.getId()%>" class="btn btn-info btn-sm"><i class="fas fa-search-dollar"></i></a>
                                    <% } else {%>
                                <a href="" class="btn btn-info btn-sm"><i class="fas fa-dollar-sign"></i></a> 
                                    <% } %>  
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
