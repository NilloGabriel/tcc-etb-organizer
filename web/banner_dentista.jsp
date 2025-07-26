<%-- 
    Document   : banner_dentista
    Created on : 24/11/2019, 00:58:22
    Author     : Administrador
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Dentista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Dentista dLogado = new Dentista();
    try {
        dLogado = (Dentista) session.getAttribute("dentista");
%>
<div class="header">
    <div class="logo">
        <a href='listar_cliente_dentista.jsp'>
            <span><i class="fas fa-tooth"></i></span>
            <span>IOOG</span>
        </a>
    </div>
    <a href="#" class="nav-trigger"><span></span></a>
</div>

<div class="side-nav">
    <div class="logo">
        <a href='listar_cliente_dentista.jsp'>
            <span><i class="fas fa-tooth"></i></span>
            <p>IOOG</p>
        </a>
    </div>
    <nav>
        <ul>
            <%
                for (Menu m : dLogado.getPerfil().getMenus()) {

            %>
            <a href='<%=m.getLink()%>'> <li><span><%=m.getTitulo()%></span></li> </a>
            <%
                }
            %>
            <li>
                <%
                    out.print(dLogado.getNome());
                %>,
                <script>
                    verificaHora();
                </script>
                <a href="logof_dentista.jsp"> 
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Sair</span> 
                </a>
            </li>
            
                <%                                
                    } catch (Exception e) {
                        response.sendRedirect("login_dentista.jsp");
                    }
                %>
            
        </ul>
    </nav>
</div>  


