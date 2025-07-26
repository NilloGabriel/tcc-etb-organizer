<%-- 
    Document   : agendamento_dentistadata
    Created on : 21/11/2019, 17:28:53
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="modelo.Servicos"%>
<%@page import="modelo.ServicosDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Agendamento da Consulta";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <%  Consulta agendamento = new Consulta();
            ArrayList<Dentista> dentista = new ArrayList<Dentista>();
            try {
                DentistaDAO dDAO = new DentistaDAO();
                dentista = dDAO.listar();
                int servico = Integer.parseInt(request.getParameter("servico"));
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                ServicosDAO sDAO = new ServicosDAO();
                Servicos s = sDAO.carregarPorId(servico);
                ClienteDAO cDAO = new ClienteDAO();
                Cliente c = cDAO.carregarPorId(id_cliente);
                agendamento.setCliente(c);
                agendamento.setServicos(s);
                session.setAttribute("agendamento", agendamento);
            } catch (Exception e) {
                out.print("Erro" + e);
            }
        %>   
        <%
           Calendar c = Calendar.getInstance(); 
           Date date = c.getTime();
           SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
            
        %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Escolher dentista e marcar data para a consulta do cliente: <%=agendamento.getCliente().getNome()%></h2>
            </div>

            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="gerenciar_consulta" action="agendamento_horario.jsp" method="post">
                        <input type="hidden" name="id_cliente" value="<%=agendamento.getCliente().getId()%>">
                        <input type="hidden" name="id_servicos" value="<%=agendamento.getServicos().getId()%>">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <h4><label for="inputDentista"> Dentistas Disponíveis: </label></h4>
                                <select class="form-control" id="inputDentista" name="dentistas" required>
                                    <option value="">Escolha...</option>
                                    <%
                                        for (Dentista d : dentista) {
                                    %>  
                                    <option value="<%=d.getId()%>"><%=d.getNome()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group col-sm-4">
                                <h4><label for="inputData">Data da Consulta:</label></h4>
                                <input type="date" class="form-control" id="inputData" name="data_consulta" min="<%=sp.format(date)%>" required />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-primary" value="Próximo"/>
                                <button class="btn btn-danger" onclick="history.go(-1);">Voltar</button>
                            </div>
                        </div>
                    </form>                 
                </div>
            </div>
        </div>
    </body>
</html>
