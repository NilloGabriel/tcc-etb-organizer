<%-- 
    Document   : form_inserir_dentista
    Created on : 07/11/2019, 21:47:29
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.DentistaDAO"%>
<%@page import="modelo.Dentista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <% String name = "Novo Dentista";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Novo Dentista</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="inserir_dentista" action="inserir_dentista.do?op=c" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="inputNome"> Nome: </label>
                                <input type="text" class="form-control" id="inputNome" placeholder="Nome" name="nome" required />
                            </div>

                            <div class="form-group col-sm-2">
                                <label for="inputSexo">Sexo:</label>
                                <select class="form-control" id="inputSexo" name="sexo" required>
                                    <option selected>Escolha...</option>
                                    <option value="M"> Masculino </option>
                                    <option value="F"> Feminino </option>
                                </select>
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputDataNas">Data de Nascimento:</label>
                                <input type="date" class="form-control" id="inputDataNas" name="data_nascimento" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputRg">RG:</label>
                                <input type="text" class="form-control" id="inputRg" placeholder="RG" name="rg" maxlength="9" OnKeyPress="formatar('#.###.###', this)" required />
                            </div> 

                            <div class="form-group col-sm-4">
                                <label for="inputCpf">CPF:</label>
                                <input type="text" class="form-control" id="inputCpf" placeholder="CPF" name="cpf" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputCfo">CFO:</label>
                                <input type="text" class="form-control" id="inputCfo" placeholder="CFO" name="cfo" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputEmail">Email:</label>
                                <input type="text" class="form-control" id="inputEmail" placeholder="Email" name="email" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputTelefone">Telefone:</label>
                                <input type="text" class="form-control" id="inputTelefone" placeholder="Telefone" name="telefone" maxlength="12" OnKeyPress="formatar('## ####-####', this)" required />
                            </div>

                            <div class="form-group col-sm-8">
                                <label for="inputEndereco">Endereço:</label>
                                <input type="text" class="form-control" id="inputEndereco" placeholder="Endereço" name="endereco" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputCep">CEP:</label>
                                <input type="text" class="form-control" id="inputCep" placeholder="CEP" name="cep" maxlength="9" OnKeyPress="formatar('#####-###', this)" required />
                            </div> 

                            <div class="form-group col-sm-4">
                                <label for="inputLogin">Login:</label>
                                <input type="text" class="form-control" id="inputLogin" placeholder="Login" name="login" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputSenha">Senha:</label>
                                <input type="password" class="form-control" id="inputSenha" placeholder="Senha" name="senha" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputPerfil">Perfil:</label>
                                <select class="form-control" id="inputPerfil" name="perfil" required>
                                    <option selected>Escolha...</option>
                                    <%                    ArrayList<Perfil> lista = new ArrayList<Perfil>();
                                        PerfilDAO pDAO = new PerfilDAO();
                                        try {
                                            lista = pDAO.listar();
                                        } catch (Exception e) {
                                            out.print("Erro:" + e);
                                        }

                                        for (Perfil p : lista) {
                                    %>
                                    <option value="<%=p.getId()%>"><%=p.getNome()%></option>               
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