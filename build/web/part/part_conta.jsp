<%-- 
    Document   : part_conta
    Created on : 31/01/2011, 18:36:28
    Author     : ismaily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Participante" %>
<%@page import="br.ufc.pet.util.UtilSeven" %>
<%@page import="java.util.Date" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%
            String mensagem = (String) request.getAttribute("mensagem");
            Participante part = (Participante) session.getAttribute("user");
            String fone = part.getUsuario().getFone();
            String instituicao = part.getUsuario().getInstituicao();
            Date dataNascimento = part.getUsuario().getDataNascimento();
            String sexo = part.getUsuario().getSexo();
            String rua = part.getUsuario().getRua();
            String cidade = part.getUsuario().getCidade();
            String bairro = part.getUsuario().getBairro();
            String uf = part.getUsuario().getUf();
            String numero = part.getUsuario().getNumero();
            String confirSenha = part.getUsuario().getSenha();
            String data = null;
            if (fone == null || fone.trim().isEmpty()) {
                fone = "";
            }
            if (cidade == null || cidade.trim().isEmpty()) {
                cidade = "";
            }
            if (instituicao == null || instituicao.trim().isEmpty()) {
                instituicao = "";
            }
            if (sexo == null || sexo.trim().isEmpty()) {
                sexo = "";
            }
            if (rua == null || rua.trim().isEmpty()) {
                rua = "";
            }
            if (bairro == null || bairro.trim().isEmpty()) {
                bairro = "";
            }
            if (uf == null || uf.trim().isEmpty()) {
                uf = "";
            }
            if (numero == null || numero.trim().isEmpty()) {
                numero = "";
            }
            if (dataNascimento == null) {
                data = "";
            } else {
                data = UtilSeven.treatToString(part.getUsuario().getDataNascimento());
            }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../Script.js"> </script>
        <title>Editar Conta</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%@include file="part_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Editar Dados Cadastrais</h1>
                <%if (mensagem != null) {%>
                <h3><%=mensagem%></h3><br />
                <% }%>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <input type="hidden" name="comando" value="CmdEditarParticipante" />
                    <fieldset>
                        <%@include file="../error.jsp" %>
                        <label style="float: right;">* Campos obrigatórios</label><br/>
                        <label>Nome (*):</label><br />
                        <input type="text" maxlength="50" value="<%=part.getUsuario().getNome()%>" name="nome" 
                            <% if(part.getUsuario().isCertificadoGerado()) {%>   
                                disabled="disabled"
                            <% } %>
                        /><br />
                        <label>Telefone:</label><br />
                        <input type="text" maxlength="12" value="<%=fone%>" onkeypress="return formataContato(this, event)" name="fone" /><br />
                        <label>E-mail (*):</label><br />
                        <input type="text" maxlength="50" value="<%=part.getUsuario().getEmail()%>" name="email" /><br />
                        <label>Data de Nascimento:</label><br />
                        <input type="text" name="dt_nascimento" value="<%=data%>" onkeypress="return formataData(this,event)" maxlength="10"/><br />
                        <label>Sexo (*):</label><br />
                        <select id="sexo" name="sexo">
                            <option value="Masculino">Masculino</option>
                            <option value="Feminino">Feminino</option>
                        </select> <br/>
                        <label>Instituição:</label><br />
                        <input type="text" maxlength="50" value="<%=instituicao%>" name="instituicao" /><br />
                        <label>Rua (*):</label><br />
                        <input type="text" maxlength="50" value="<%=rua%>" name="rua" /><br />
                        <label>Bairro (*):</label><br />
                        <input type="text" maxlength="50" value="<%=bairro%>" name="bairro" /><br />
                        <label>Número (*):</label><br />
                        <input type="text" maxlength="6" value="<%=numero%>" onkeypress="return validaNumerosSilencioso(event);" name="numero" /><br />
                        <label>Cidade (*):</label><br />
                        <input type="text" maxlength="50" value="<%=cidade%>" name="cidade" /><br />
                        <label>UF (*):</label><br />
                        <input type="text" maxlength="50" value="<%=uf%>" name="uf" /><br />
                        <label>Senha (*):</label><br />
                        <input type="password" maxlength="50" value="<%=confirSenha%>" name="senha" /><br />
                        <label>Repita a senha (*):</label><br />
                        <input type="password" maxlength="50" value="<%=confirSenha%>" name="r-senha" /><br />
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" />
                    <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
