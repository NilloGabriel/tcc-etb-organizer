 <%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<html>
    <% String name = "Gerenciar Menu Perfil";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Gerenciar Menu Perfil</h2>
            </div>
            <div class="text-center mt-4">
                <form name="menu_perfil" action="gerenciar_menu_perfil.do" method="post">                                       

                    ID: <%=p.getId()%>  Nome: <%=p.getNome()%><br/>
                    <input type="hidden" value="<%=p.getId()%>" name="id_perfil"/>
                    <input type="hidden" value="vincular" name="op"/>
                    <select name="id_menu" required>
                        <option value=""> Selecione... </option>
                        <%
                            ArrayList<Menu> lista = new ArrayList<Menu>();
                            PerfilDAO pDAO = new PerfilDAO();
                            try {
                                lista = pDAO.menusNaoVinculados(p.getId());
                            } catch (Exception e) {
                                out.print("Erro:" + e);
                            }

                            for (Menu m : lista) {
                        %>
                        <option value="<%=m.getId()%>"><%=m.getTitulo()%></option>               
                        <%
                            }
                        %>
                    </select>

                    <input type="submit" value="+"/> 
                </form>
                <h2 class="text-center">Menus Vinculados</h2>
                <div class="table-responsive-sm table-responsive-lg table-responsive-xl table-responsive-md">
                    <table class="table table-sm table-hover">
                        <thead class="thead-dark text-center">
                            <tr>                         
                                <th scope="col">ID</th>
                                <th scope="col">Título</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <%
                            for (Menu m : p.getMenus()) {
                        %>
                        <tbody class="text-center">
                            <tr>
                                <td><%=m.getId()%></td>
                                <td><%=m.getTitulo()%></td>
                                <td>
                                    <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId()%>&id_perfil=<%=p.getId()%>&op=remover" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                                </td>
                            </tr> 
                        </tbody>
                        <%
                            }
                        %>   
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
