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
                window.open("excluir_consulta.do?id=" + id, "_self");
            }
        }
    </script>

    <% String name = "Lista de Consultas";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner_dentista.jsp"%>
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
                        <th scope="col">hora da Consulta</th>
                        <th scope="col">Tipo de Serviço</th>
                        <th scope="col">Médico a Atender</th>
                        <th scope="col">Para o Cliente</th>
                        <th scope="col">Funcionário que Marcou</th>
                    </tr>
                    </thead>
                    <%                    for (Consulta c : lista) {
                        if(dLogado.getId() == c.getDentista().getId()){
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
                    </tr>  
                    </tbody>
                    <%
                        }
}
                    %>   
                </table>
            </div>
        </div>
    </body>
</html>
