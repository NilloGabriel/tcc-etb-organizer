<%-- 
    Document   : form_inserir_cliente
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "Novo Cliente";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body>
        <%@include file="banner.jsp" %>
        <div class="main-content">
            <div class="title text-center">
                <h2>Novo Cliente</h2>
            </div>
            <div class="row justify-content-center pl-4 mt-4 mb-4">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <form name="inserir_cliente" action="inserir_cliente.do?op=c" method="post">
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

                            <div class="form-group col-sm-6">
                                <label for="inputRg">RG:</label>
                                <input type="text" class="form-control" id="inputRg" placeholder="RG" name="rg" maxlength="9" OnKeyPress="formatar('#.###.###', this)" required />
                            </div> 

                            <div class="form-group col-sm-6">
                                <label for="inputCpf">CPF:</label>
                                <input type="text" class="form-control" id="inputCpf" placeholder="CPF" name="cpf" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required />
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
