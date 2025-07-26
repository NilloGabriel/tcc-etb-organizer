<%-- 
    Document   : status_comparecimento
    Created on : 23/11/2019, 22:36:57
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Status de Comparecimento";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <body>
        <%@include file="banner.jsp" %>   
        <%            int id_consulta = Integer.parseInt(request.getParameter("id"));
        %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Status de Comparecimento</h2>     
            </div>

            <h3 class="text-center mt-4"> Selecione o Status de Comparecimento:</h3>
            <div class="text-center mt-4 mb-4">
                <form name="pagou" action="registrar_status.do" method="post">
                    <input type="hidden"  name="id" value="<%=id_consulta%>">
                    <select  class="form-control-sm" name="status_consulta" required>
                        <option value="">Escolha...</option>
                        <option value="compareceu">Compareceu</option>
                        <option value="ausente">Ausente</option>
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
</html>
