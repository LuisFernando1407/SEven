<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Usuario"%>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%
            String mensagem = (String) request.getAttribute("mensagem");
            Usuario usuarioTemp = (Usuario) session.getAttribute("usuarioTemp");
            session.removeAttribute("usuarioTemp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Novo Responsavel</title>
        <script type="text/javascript" src="../Script.js"></script>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Cadastro</h1>
                <%@include file="/error.jsp" %>
                <%if (mensagem != null) {%>
                <h3><%=mensagem%></h3><br />
                <% }%>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <input type="hidden" name="comando" value="CmdCadastrarUsuarioResponsavel" />
                    <fieldset>
                        <label>Nome Completo*:</label><br />
                        <input type="text" name="nome" value="<%= (usuarioTemp != null) ? usuarioTemp.getNome() : ""%>"/><br />
                        <label>E.mail*:</label><br />
                        <input type="text" name="email"value="<%=(usuarioTemp != null) ? usuarioTemp.getEmail() : ""%>" /><br />
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" />
                    <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
