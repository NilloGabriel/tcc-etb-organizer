<%-- 
    Document   : agendamento_horario
    Created on : 21/11/2019, 21:27:22
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.ConsultaDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.Servicos"%>
<%@page import="modelo.ServicosDAO"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
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

            try {
                Date data_consulta = (Date) Date.valueOf(request.getParameter("data_consulta"));
                int id_dentistas = Integer.parseInt(request.getParameter("dentistas"));
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                int id_servico = Integer.parseInt(request.getParameter("id_servicos"));
                ClienteDAO cDAO = new ClienteDAO();
                Cliente c = cDAO.carregarPorId(id_cliente);
                DentistaDAO dDAO = new DentistaDAO();
                Dentista d = dDAO.carregarPorId(id_dentistas);
                ServicosDAO sDAO = new ServicosDAO();
                Servicos s = sDAO.carregarPorId(id_servico);
                agendamento.setData_consulta(data_consulta);
                agendamento.setCliente(c);
                agendamento.setDentista(d);
                agendamento.setServicos(s);
                session.setAttribute("agendamento", agendamento);
            } catch (Exception e) {
                out.print("Erro" + e);
            }
        %>    
        <%
            SimpleDateFormat hr = new SimpleDateFormat("HH:mm:ss"); 
        %>
        <div class="main-content">
            <div class="title text-center"> 
                <h2>Você está marcando a consulta para o cliente: <%=agendamento.getCliente().getNome()%> </h2>
            </div> 

            <h3 class="text-center mt-4">Horários Disponíveis:</h3> 
            <div class="text-center mt-4 mb-4">
                <form name="consulta" action="resumo_consulta.jsp">
                    <input type="hidden" name="id_cliente" value="<%=agendamento.getCliente().getId()%>">
                    <input type="hidden" name="id_servicos" value="<%=agendamento.getServicos().getId()%>">
                    <input type="hidden" name="data_consulta" value="<%=agendamento.getData_consulta()%>">
                    <input type="hidden" name="dentista" value="<%=agendamento.getDentista().getId()%>">              
                    <select class="form-control-sm" name="hora_consulta">
                        <%
                            ArrayList<Consulta> lista_horarios = new ArrayList<Consulta>();
                            ConsultaDAO cDAO = new ConsultaDAO();
                            lista_horarios = cDAO.lista_horarios();
                            ArrayList<String> horarios = new ArrayList();
                            horarios.add("08:00:00");
                            horarios.add("08:30:00");
                            horarios.add("09:00:00");
                            horarios.add("10:00:00");
                            horarios.add("10:30:00");
                            horarios.add("11:00:00");
                            horarios.add("11:30:00");
                            horarios.add("14:00:00");
                            horarios.add("15:00:00");
                            horarios.add("16:00:00");
                            horarios.add("17:00:00");
                            horarios.add("18:00:00");

                        %>
                        <%  for (Consulta agendab : lista_horarios) {
                                    if (hr.format(agendab.getHora_consulta()).equals(horarios.get(0)) && agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(0, "indisponivel");
                                        
                                    }
                                    if (horarios.get(1).equals(hr.format(agendab.getHora_consulta())) && agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && 
                                            agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                           horarios.set(1, "indisponivel");
                                        
                                    }
                                    if (horarios.get(2).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(2, "indisponivel");
                                        
                                    }
                                    if (horarios.get(3).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(3, "indisponivel");
                                        
                                    }
                                    if (horarios.get(4).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(4, "indisponivel");
                                        
                                    }
                                    if (horarios.get(5).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(5, "indisponivel");
                                        
                                    }
                                    if (horarios.get(6).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(6, "indisponivel");
                                        
                                    }
                                    if (horarios.get(7).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(7, "indisponivel");
                                        
                                    }
                                    if (horarios.get(8).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(8, "indisponivel");
                                        
                                    }
                                    if (horarios.get(9).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(9, "indisponivel");
                                        
                                    }
                                    if (horarios.get(10).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(10, "indisponivel");
                                        
                                    }
                                    if (horarios.get(11).equals(hr.format(agendab.getHora_consulta()))&& agendab.getDentista().getId() ==
                                            agendamento.getDentista().getId() && agendab.getData_consulta().equals(agendamento.getData_consulta())) {
                                            horarios.set(11, "indisponivel");
                                        
                                    }
                                    
                                }%>
                               
                            <%
                                

                            for (String hor: horarios){ %>
                            <option value="<%=hor%>"><%=hor%></option>
                         <%
                            }

                        %>

                       
                    </select>
                    <div class="form-row mt-3">
                        <div class="col-sm-12">
                            <input type="submit" class="btn btn-primary" value="Enviar"/>
                            <button class="btn btn-danger" onclick="history.go(-1);">Voltar</button>
                        </div>
                    </div>
                </form>  
            </div>
        </div>
    </body>
</html>
