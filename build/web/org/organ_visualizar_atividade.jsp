<%-- 
    Document   : organ_visualizar_atividade
    Created on : 20/07/2010, 23:50:06
    Author     : Escritorio projetos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, br.ufc.pet.evento.TipoAtividade,br.ufc.pet.evento.ResponsavelAtividade,br.ufc.pet.evento.Horario,br.ufc.pet.evento.Atividade" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
    </head>
    <body>
        <%
                    Atividade a = (Atividade) session.getAttribute("atividade");
        %>
        <div id="container">
            <div id="top">
                <%@include file="organ_menu.jsp" %>
            </div>
            <p>
                <label style=" color:black; font-weight: bold;"> Nome:</label><br/>
                <%=a.getNome()%>
            </p>
            <p> <label style=" color:black; font-weight: bold;">Local:</label><br/>
                <%=a.getLocal()%>
            </p>
            <p>
                <label style=" color:black; font-weight: bold;">Vagas:</label><br/>
                <%=" " + a.getVagas()%>
            </p>
            <p>
                <label style=" color:black; font-weight: bold;">Tipo:</label><br/>
                <%=a.getTipo().getNome()%>
            </p>
            <p>
                <label style=" color:black; font-weight: bold;">Horarios:</label><br/>
                <%for (Horario h1 : a.getHorarios()) {%>
                <%=h1.printHorario() + " <br>"%>
                <%}%>
            </p>
            <label style=" color:black; font-weight: bold;">Responsáveis:</label><br/>
            <% for (ResponsavelAtividade resp : a.getResponsaveis()) {%>
            <label><%=resp.getUsuario().getNome()%></label><br />
            <%}%>
            <p><a href="" title="" onclick="history.back(); return false;" class="voltar">Voltar</a></p>
            <div id="footer"></div>
        </div>
    </body>
</html>
