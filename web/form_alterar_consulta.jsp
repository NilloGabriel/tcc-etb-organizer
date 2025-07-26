<%-- 
    Document   : form_alterar_consulta
    Created on : 24/11/2019, 19:17:52
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Dentista"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Consulta"%>
<%@page import="modelo.Consulta"%>
<%@page import="modelo.ConsultaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Consulta c = new Consulta();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ConsultaDAO cDAO = new ConsultaDAO();
        c = cDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<%    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

%>
<!DOCTYPE html>
<html>
    <% String name = "Alterar Consulta";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center" >
                Alterar o Agendamento
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="alterar_consulta" action="alterar_consulta.do?op=c" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-1">
                                <label for="hiddenId">ID:</label><%=c.getId()%>
                                <input type="hidden" id="hiddenId" value="<%=c.getId()%>" name="id"/>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="inputHorario">Horários Dísponiveis:</label><br>
                                <select class="form-control-sm" id="inputHorario" name="hora_consulta" required>
                                    <%
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
                                        for (String hor : horarios) {
                                    %>
                                    <option value="<%=hor%>"><%=hor%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="inputDestista">Dentistas Dísponiveis:</label>
                                <select class="form-control-sm" id="inputDentista" name="dentista" required>
                                    <option value="">Escolha o Dentista</option>
                                    <%  ArrayList<Dentista> dentista = new ArrayList<Dentista>();
                                        DentistaDAO dDAO = new DentistaDAO();
                                        try {
                                            dentista = dDAO.listar();
                                        } catch (Exception e) {
                                            out.print("Erro:" + e);
                                        }
                                        for (Dentista d : dentista) {
                                    %>  
                                    <option value="<%=d.getId()%>"><%=d.getNome()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-primary" value="Salvar"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
