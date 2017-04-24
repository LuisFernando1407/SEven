<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Organizador" %>
<%@page import="br.ufc.pet.evento.Evento" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%
                String men = (String) session.getAttribute("men");
    %>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Relatórios</h1>
                <div id="list">
                    <%if (men != null) {%>
                    <center><label><%=men%></label></center>
                    <%}%>
                    <form action="" >
                        <input type="hidden" name="comando"/>
                        <ul>
                            <li><a href="../ServletCentral?comando=CmdListarAtividadesDownload" title="">Relatório de Participante por Atividade</a></li>
                            <li><a href="../ServletCentral?comando=CmdListarAtividadeFrequencia" title="">Gerar Lista de Presença em Atividades</a></li>                          
                            <li><a href="../ServletCentral?comando=CmdRelatorioParticipantesQuites" title="">Relatório de Participante Quites</a></li>
                            <li><a href="../ServletCentral?comando=CmdListarParticipantes" title="">Listar Participantes</a></li>
                            <li><a href="" title="">Relatório de Movimento do Caixa</a></li>
                        </ul>
                    </form>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
