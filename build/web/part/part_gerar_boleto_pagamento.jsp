<%-- 
    Document   : part_gerar_boleto_pagamento
    Created on : 14/07/2010, 09:41:33
    Author     : welligton
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Inscricao" %>
<%@page import="java.util.*"%>
<%@page import="br.ufc.pet.evento.Participante"%>
<%@page import="br.ufc.pet.services.ParticipanteService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%
                ArrayList<Inscricao> inscricoes = (ArrayList<Inscricao>) session.getAttribute("inscricoes");
                Participante p = (Participante) session.getAttribute("user");
                String men = (String) session.getAttribute("men");
                session.removeAttribute("men");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Boleto</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
            </div>
            <div id="content">
                <div id="list">       
                    <%if (men != null) {%>
                    <label><center><%=men%></center></label><br />
                    <%}%>
                    <%if (inscricoes == null || inscricoes.size() == 0) {%>
                    <center><label>Sem Inscrições no momento</label></center>
                    <%} else
                        for (Inscricao ics : inscricoes) {%>
                    <a href="../ServletCentral?comando=CmdGerarBoletoPagamento&idInc=<%=ics.getId()%>">Boleto</a>
                    <%}%>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
