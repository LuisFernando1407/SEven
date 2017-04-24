<%-- 
    Document   : visualizar_dados_participante
    Created on : 02/02/2011, 22:28:03
    Author     : ismaily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
                uf = "Não informado";
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
        <title>Visualizar Dados Cadastrais</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%@include file="part_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Dados Cadastrais</h1>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <fieldset class="none">               
                        <ul>
                            <li><label class="labelVisual">Nome: </label>
                                <label><%=part.getUsuario().getNome()%></label></li>
                            <li><label class="labelVisual">Telefone: </label>
                                <label><%=fone%></label></li>
                            <li><label class="labelVisual">E-mail: </label>
                                <label><%=part.getUsuario().getEmail()%></label></li>
                            <li><label class="labelVisual">Nascimento: </label>
                                <label><%=data%></label></li>
                            <li><label class="labelVisual">Sexo: </label>
                                <label><%=sexo%></label></li>
                            <li><label class="labelVisual">Instituição: </label>
                                <label><%=instituicao%></label></li>
                            <li><label class="labelVisual">Rua: </label>
                                <label><%=rua%></label></li>
                            <li><label class="labelVisual">Bairro: </label>
                                <label><%=bairro%></label></li>
                            <li><label class="labelVisual">Número: </label>
                                <label><%=numero%></label></li>
                            <li><label class="labelVisual">Cidade: </label>
                                <label><%=cidade%></label></li>
                            <li><label class="labelVisual">UF: </label>
                                <label><%=uf%></label></li>
                        </ul>
                    </fieldset>
                </form>
                <p><a href="" title="" onclick="history.back(); return false;" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
