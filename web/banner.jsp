<%-- 
    Document   : banner
    Created on : 01/10/2019, 16:17:23
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Dentista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Funcionario fLogado = new Funcionario();;
    try {
        fLogado = (Funcionario) session.getAttribute("funcionario");
%>
<div class="header">
    <div class="logo">
        <a href='listar_cliente.jsp'>
            <span><i class="fas fa-tooth"></i></span>
            <span>IOOG</span>
        </a>
    </div>
    <a href="#" class="nav-trigger"><span></span></a>
</div>

<div class="side-nav">
    <div class="logo">
        <a href='listar_cliente.jsp'>
            <span><i class="fas fa-tooth"></i></span>
            <p>IOOG</p>
        </a>
    </div>
    <nav>
        <ul>

            <%
                for (Menu ma : fLogado.getPerfil().getMenus()) {
            %>

            <a href='<%=ma.getLink()%>'> <li><span><%=ma.getTitulo()%></span></li> </a>
                        <%
                            }
                        %>
            <li>
                <%
                    out.print(fLogado.getNome());
                %>,
                <script>
                    verificaHora();
                </script>
                <a href="logof.jsp"> 
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Sair</span> 
                </a>
            </li>
            <%
                } catch (Exception e) {
                    response.sendRedirect("login.jsp");
                }

            %>
        </ul>
    </nav>
</div>  
