<%-- 
    Document   : gerencia_conta
    Created on : 02/02/2011, 22:26:01
    Author     : ismaily
--%>
<%-- 
    Document   : gerencia_conta
    Modified in : 
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Participante" %>
<%@page import="br.ufc.pet.util.UtilSeven" %>
<%@page import="java.util.Date" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%
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
            String data = null;
            if (fone == null || fone.trim().isEmpty()) {
                fone = "Não informado";
            }
            if (cidade == null || cidade.trim().isEmpty()) {
                cidade = "Não informado";
            }
            if (instituicao == null || instituicao.trim().isEmpty()) {
                instituicao = "Não informado";
            }
            if (sexo == null || sexo.trim().isEmpty()) {
                sexo = "Não informado";
            }
            if (rua == null || rua.trim().isEmpty()) {
                rua = "Não informado";
            }
            if (bairro == null || bairro.trim().isEmpty()) {
                bairro = "Não informado";
            }
            if (uf == null || uf.trim().isEmpty()) {
                uf="Não informado";
            }
            if (numero == null || numero.trim().isEmpty()) {
                numero = "Não informado";
            }
            if (dataNascimento == null) {
                data = "Não informado";
            } else {
                data = UtilSeven.treatToString(part.getUsuario().getDataNascimento());
            }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="Script.js"> </script>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Gerenciar Conta</title>
    </head>
    <body>
        <div id="container" class="container-fluid center-block">
            <div id="top">
                <%@include file="part_menu.jsp" %>
            </div>
            <div class="row center-block">
                <h1>Gerenciar Conta</h1>
                <form action="../ServletCentral" method="post">
                    <fieldset>
                        <h2>Dados Cadastrais:</h2>
                            <label class="labelVisual">Nome: </label>
                            <label><%=part.getUsuario().getNome()%></label><br>
                            <label class="labelVisual">Telefone: </label>
                                <label><%=fone%></label>
                            <label class="labelVisual">E-mail: </label>
                                <label><%=part.getUsuario().getEmail()%></label><br>
                            <label class="labelVisual">Nascimento: </label>
                                <label><%=data%></label><br>
                            <label class="labelVisual">Sexo: </label>
                                <label><%=sexo%></label><br>
                            <label class="labelVisual">Instituição: </label>
                                <label><%=instituicao%></label><br>
                            <label class="labelVisual">Rua: </label>
                                <label><%=rua%></label><br>
                            <label class="labelVisual">Bairro: </label>
                                <label><%=bairro%></label><br>
                            <label class="labelVisual">Número: </label>
                                <label><%=numero%></label><br>
                            <label class="labelVisual">Cidade: </label>
                                <label><%=cidade%></label><br>
                            <label class="labelVisual">UF: </label>
                                <label><%=uf%></label><br>
                    </fieldset>
                </form>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <fieldset>
                        <a class="btn btn-default" href="part_conta.jsp">Editar Dados</a>
                        <a class="btn btn-default" href="../ServletCentral?comando=CmdExcluirParticipante" onclick="return confirm('Tem certeza que deseja excluir conta?')" title="">Excluir Conta</a>
                    </fieldset>                   
                </form><br>
                <p><a href="" title="" onclick="history.back(); return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a></p>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
