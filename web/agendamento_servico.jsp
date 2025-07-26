<%-- 
    Document   : agendamento_servico
    Created on : 18/11/2019, 14:38:55
    Author     : Administrador
--%>

<%@page import="modelo.ServicosDAO"%>
<%@page import="modelo.Servicos"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.awt.CardLayout"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="modelo.ClienteDAO"%>
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
        <%           Consulta agendamento = new Consulta();
            ArrayList<Servicos> servicos = new ArrayList<Servicos>();
            try {
                String op = request.getParameter("op");
                ServicosDAO sDAO = new ServicosDAO();
                servicos = sDAO.listar();

                if (op.equals("n")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ClienteDAO cDAO = new ClienteDAO();
                    Cliente c = cDAO.carregarPorId(id);
                    agendamento.setCliente(c);
                    agendamento.setFuncionario(fLogado);
                    session.setAttribute("agendamento", agendamento);
                } else {
                    session.setAttribute("agendamento", agendamento);
                }

            } catch (Exception e) {
                out.print("Erro" + e);
            }
        %>    
        <div class="main-content">
            <div class="title text-center">
                <h2>
                    Você está marcando a consulta para o cliente: <%=agendamento.getCliente().getNome()%><br>                   
                </h2>
            </div>

            <h3 class="text-center mt-4"> Selecione o Serviço Desejado:</h3>
            <div class="text-center mt-4 mb-4">
                <form name="gerenciar_consulta_manutencao" action="agendamento_dentistadata.jsp" method="post">
                    <input type="hidden" name="id_cliente" value="<%=agendamento.getCliente().getId()%>">
                    <select  class="form-control-sm" name="servico" required>
                        <option value="">Escolha...</option>
                        <%
                            for (Servicos s : servicos) {
                        %>  
                        <option value="<%=s.getId()%>"><%=s.getNome()%></option>
                        <%
                            }
                        %>
                    </select>
                    <div class="form-row mt-3">
                        <div class="col-sm-12">
                            <input type="submit" class="btn btn-primary" value="Próximo"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
