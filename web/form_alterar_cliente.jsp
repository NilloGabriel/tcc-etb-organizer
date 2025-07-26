<%-- 
    Document   : form_alterar_cliente
    Created on : 06/11/2019, 15:11:19
    Author     : Administrador
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cliente c = new Cliente();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<%    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

%>

<!DOCTYPE html>
<html>
    <% String name = "Alterar Cliente";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Alterar Cliente</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="alterar_cliente" action="alterar_cliente.do?op=c" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-1">
                                <label for="hiddenId">ID:</label><%=c.getId()%>
                                <input type="hidden" id="hiddenId" value="<%=c.getId()%>" name="id"/>
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputNome"> Nome: </label>
                                <input type="text" class="form-control" id="inputNome" name="nome" value="<%=c.getNome()%>" required />
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
                                <input type="date" class="form-control" id="inputDataNas" name="data_nascimento" value="<%=c.getData_nascimento()%>" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputRg">RG:</label>
                                <input type="text" class="form-control" id="inputRg" name="rg" value="<%=c.getRg()%>" maxlength="9" OnKeyPress="formatar('#.###.###', this)" required />
                            </div> 

                            <div class="form-group col-sm-6">
                                <label for="inputCpf">CPF:</label>
                                <input type="text" class="form-control" id="inputCpf" name="cpf" value="<%=c.getCpf()%>" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputEmail">Email:</label>
                                <input type="text" class="form-control" id="inputEmail" name="email" value="<%=c.getEmail()%>" required />
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="inputTelefone">Telefone:</label>
                                <input type="text" class="form-control" id="inputTelefone" name="telefone" value="<%=c.getTelefone()%>" maxlength="12" OnKeyPress="formatar('## ####-####', this)" required />
                            </div> 

                            <div class="form-group col-sm-8">
                                <label for="inputEndereco">Endereço:</label>
                                <input type="text" class="form-control" id="inputEndereco" name="endereco" value="<%=c.getEndereco()%>" required />
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="inputCep">CEP:</label>
                                <input type="text" class="form-control" id="inputCep" name="cep" value="<%=c.getCep()%>" maxlength="9" OnKeyPress="formatar('#####-###', this)" required />
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
