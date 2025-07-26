<%-- 
    Document   : form_pagamento
    Created on : 18/11/2019, 14:38:55
    Author     : Administrador
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Pagamento da Consulta";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>   
        <%            int id_consulta = Integer.parseInt(request.getParameter("id"));
        %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Pagamento da Consulta:</h2>     
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="pagou" action="registrar_pagamento.do" method="post">                        
                        <input type="hidden"  name="id" value="<%=id_consulta%>">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <h4><label for="inputValor"> Valor da Consulta: </label></h4>
                                <input type="text" class="form-control" id="inputValor" name="valor_consulta" required>
                            </div>
                            <div class="form-group col-sm-6">
                                <h4><label for="inputTipoPagamento"> Tipo de Pagamento: </label></h4>
                                <select class="form-control" id="inputTipoPagamento" name="tipo_pagamento" required>
                                    <option value="">Selecione o tipo de pagamento...</option>
                                    <option value="cartao">Cartão</option>
                                    <option value="dinheiro">Dinheiro</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-primary" value="Próximo"/>                               
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
