<%-- 
    Document   : organ_selecionar_evento
    Created on : 07/03/2011, 23:04:07
    Author     : Caio
--%>
<%-- 
    Document   : organ_selecionar_evento
    Modified in : 06/05/2017, 19:58:57
    Author     : João Mateus
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
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp" %>
            <div id="content">
                <h1 class="titulo">Gerenciar atividades de evento e suas características</h1><br>
                <table id="data_table" class="table table-hover">
                    <thead>
                        <tr>
                            <th>Sigla</th>
                            <th>Evento</th>
                            <th>Programação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Organizacao o : org.getOrganizacoes()) {%>
                        <tr class="text-center">
                            <td> <%= o.getEvento().getSigla()%> </td>
                            <td> <a href="../ServletCentral?comando=CmdGerenciarEvento&cod_evento=<%= o.getEvento().getId()%>"><%= o.getEvento().getNome()%></a></td>
                            <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%= o.getEvento().getId()%>" title="Programacao" > Visualizar</a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>