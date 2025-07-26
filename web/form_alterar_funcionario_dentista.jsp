<%-- 
    Document   : form_inserir_usuario
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Funcionario f = new Funcionario();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        FuncionarioDAO fDAO = new FuncionarioDAO();
        f = fDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<%    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

%>

<!DOCTYPE html>
<html>
    <% String name = "Alterar Funcionário";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner_dentista.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Alterar Funcionário</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="alterar_funcionario" action="alterar_funcionario.do?op=d" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-1">
                                <label for="hiddenId">ID:</label><%=f.getId()%>
                                <input type="hidden" id="hiddenId" value="<%=f.getId()%>" name="id"/>
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label for="inputNome"> Nome: </label>
                                <input type="text" class="form-control" id="inputNome" name="nome" value="<%=f.getNome()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-2">
                                <label for="inputSexo">Sexo:</label>
                                <select class="form-control" id="inputSexo" name="sexo" required>                                   
                                    <option value="M"> Masculino </option>
                                    <option value="F"> Feminino </option>
                                </select>
                            </div>
                            
                            <div class="form-group col-sm-3">
                                <label for="inputDataNas">Data de Nascimento:</label>
                                <input type="date" class="form-control" id="inputDataNas" name="data_nascimento" value="<%=f.getData_nascimento()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label for="inputRg">RG:</label>
                                <input type="text" class="form-control" id="inputRg" name="rg" value="<%=f.getRg()%>" maxlength="9" OnKeyPress="formatar('#.###.###', this)" required />
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label for="inputCpf">CPF:</label>
                                <input type="text" class="form-control" id="inputCpf" name="cpf" value="<%=f.getCpf()%>" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required />
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label for="inputEmail">Email:</label>
                                <input type="text" class="form-control" id="inputEmail" name="email" value="<%=f.getEmail()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label for="inputTelefone">Telefone:</label>
                                <input type="text" class="form-control" id="inputTelefone" name="telefone" value="<%=f.getTelefone()%>" maxlength="12" OnKeyPress="formatar('## ####-####', this)" required />
                            </div>
                            
                            <div class="form-group col-sm-8">
                                <label for="inputEndereco">Endereço:</label>
                                <input type="text" class="form-control" id="inputEndereco" name="endereco" value="<%=f.getEndereco()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-4">
                                <label for="inputCep">CEP:</label>
                                <input type="text" class="form-control" id="inputCep" name="cep" value="<%=f.getCep()%>" maxlength="9" OnKeyPress="formatar('#####-###', this)" required />
                            </div> 
                            
                            <div class="form-group col-sm-4">
                                <label for="inputLogin">Login:</label>
                                <input type="text" class="form-control" id="inputLogin" name="login" value="<%=f.getLogin()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-4">
                                <label for="inputSenha">Senha:</label>
                                <input type="password" class="form-control" id="inputSenha" name="senha" value="<%=f.getSenha()%>" required />
                            </div>
                            
                            <div class="form-group col-sm-4">
                                <label for="inputPerfil">Perfil:</label>
                                <select class="form-control" id="inputPerfil" name="perfil" required>                                  
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