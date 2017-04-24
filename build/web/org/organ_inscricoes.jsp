<%-- 
    Document   : organ_inscricoes
    Created on : 08/03/2011, 18:21:40
    Author     : Caio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Organizador"%>
<%@page import="br.ufc.pet.evento.Organizacao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        Organizador org = (Organizador) session.getAttribute("user");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Organizador</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>

    </head>
    <body>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <div id="top">
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Gerenciar inscrições em um evento</h1>
                <p>Selecione o evento do qual deseja gerenciar as inscrições:</p>
                <table id="data_table">
                    <thead>
                        <tr>
                            <th>Evento</th>
                            <th>Sigla</th>
                            <th>Programação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Organizacao o : org.getOrganizacoes()) {%>
                        <tr>
                            <td> <a href="../ServletCentral?comando=CmdGerenciarInscricoes&cod_evento=<%= o.getEvento().getId()%>"><%= o.getEvento().getNome()%></a></td>
                            <td> <%= o.getEvento().getSigla()%> </td>
                            <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%= o.getEvento().getId()%>" title="Programacao" > Visualizar</a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>