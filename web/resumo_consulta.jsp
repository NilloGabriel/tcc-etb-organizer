<%-- 
    Document   : resumo_consulta
    Created on : 21/11/2019, 17:13:48
    Author     : Administrador
--%>

<%@page import="modelo.Servicos"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="modelo.ServicosDAO"%>
<%@page import="java.sql.Time"%>
<%@page import="modelo.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <% String name = "Resumo da Consulta";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <%  Consulta agendamento = new Consulta();

            try {
                Time hora_consulta = (Time) Time.valueOf(request.getParameter("hora_consulta"));
                Date data_consulta = (Date) Date.valueOf(request.getParameter("data_consulta"));
                int id_dentistas = Integer.parseInt(request.getParameter("dentista"));
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                int id_servico = Integer.parseInt(request.getParameter("id_servicos"));
                ClienteDAO cDAO = new ClienteDAO();
                Cliente c = cDAO.carregarPorId(id_cliente);
                DentistaDAO dDAO = new DentistaDAO();
                Dentista d = dDAO.carregarPorId(id_dentistas);
                ServicosDAO sDAO = new ServicosDAO();
                Servicos s = sDAO.carregarPorId(id_servico);
                agendamento.setData_consulta(data_consulta);
                agendamento.setHora_consulta(hora_consulta);
                agendamento.setCliente(c);
                agendamento.setDentista(d);
                agendamento.setServicos(s);
                agendamento.setFuncionario(fLogado);
                session.setAttribute("agendamento", agendamento);
            } catch (Exception e) {
                out.print("Erro" + e);
            }
        %> 
        <div class="main-content">
            <div class="title text-center">
                <h2>Resumo da Consulta</h2>
            </div>
            <div class="table-responsive mt-4">
                <table class="table table-sm table-hover">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th scope="row"></th>
                            <th scope="col">Data da Consulta</th>
                            <th scope="col">Hora da Consulta</th>
                            <th scope="col">Tipo de Serviço</th>
                            <th scope="col">Médico a Atender</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Funcionário que está Marcando</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <th scope="row"></th>
                            <td data-label="Data da Consulta"><%=agendamento.getData_consulta()%></td>
                            <td data-label="Hora da Consulta"><%=agendamento.getHora_consulta()%></td>
                            <td data-label="Tipo de Serviço"><%=agendamento.getServicos().getNome()%></td>
                            <td data-label="Médico a Atender"><%=agendamento.getDentista().getNome()%></td>
                            <td data-label="Para o Cliente"><%=agendamento.getCliente().getNome()%></td>
                            <td data-label="Funcionário que Marcou"><%=agendamento.getFuncionario().getNome()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="form-row">
                <div class="col-sm-12 pl-5">
                    <a href="finalizar_agendamento.do"><input type="submit" class="btn btn-primary" value="Finalizar Consulta"/></a>
                    <button class="btn btn-danger" onclick="history.go(-3);">Voltar</button>
                </div>
            </div>            
        </div>
    </body>
</html>
