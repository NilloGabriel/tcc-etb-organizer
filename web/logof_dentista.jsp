<%-- 
    Document   : logof_dentista
    Created on : 24/11/2019, 14:27:50
    Author     : Administrador
--%>

<%
    
session.removeAttribute("dentista");
response.sendRedirect("login_dentista.jsp");
%>
