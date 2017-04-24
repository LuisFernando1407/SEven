<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Organizador"%>
<%@page import="br.ufc.pet.evento.Organizacao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        Organizador org = (Organizador) session.getAttribute("user");
        String nomeSaudacao = org.getUsuario().getNome().split(" ")[0];
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
                <%@include file="menu_inicial_org.jsp" %>
            </div>
            <div id="content">
                <div id="content_left">
                    <h1 class="titulo">Olá, <%=nomeSaudacao%></h1>
                    <p>Esta é a página inicial do Organizador de eventos. Quando desejar retornar a esta página, clique na opção 'Home' no menu acima.</p>
                </div>
                <div id="content_right">
                    <h1 style="text-align: center; margin-top: 8.5px; font-size: 18px;"class="titulo">Tentando gerenciar atividades em evento? </h1>
                    <p style="text-align: center">Escolha um dos links abaixo para gerenciar um evento!</p>
                    <p style="text-align: center">Para isso click no nome do evento!</p>

                    <%if (org.getOrganizacoes() == null || org.getOrganizacoes().size() == 0) {%>
                    <p style="text-align: center">Sem eventos no momento</p>
                    <%} else {%>
                    <table id="data_table">
                        <thead>
                            <tr>
                                <th>Evento</th>
                                <th>Sigla</th>
                                <th>Programação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Organizacao o : org.getOrganizacoes()) {
                                if (o.getEvento() != null) {%>
                            <tr>
                                <td> <a href="../ServletCentral?comando=CmdGerenciarEvento&cod_evento=<%= o.getEvento().getId()%>"><%= o.getEvento().getNome()%></a>  </td>
                                <td> <%= o.getEvento().getSigla()%> </td>
                                <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%= o.getEvento().getId()%>" title="Programacao" > Visualizar</a> </td>
                            </tr>
                            <% }
                                }
                            }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
