<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="br.ufc.pet.evento.Evento"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        ArrayList<Evento> ae = (ArrayList<Evento>) session.getAttribute("eventosAbertos");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo Menu --%>
                <%@include file="part_menu.jsp" %>
            </div>
            <div id="content">
                <%@include file="/error.jsp"%>
                <h1 class="titulo">Selecionar Evento para Inscrição</h1>
                <center>
                    <div style="width: 50%;">


                        <table id="data_table">
                            <% if (ae == null || ae.isEmpty()) {%>
                            <center><label>Não há eventos disponíveis</label></center>
                                <%} else {%>
                            <h2 class="titulo" style="margin-bottom: 10px;">Eventos abertos:</h2>
                            <thead>
                                <tr>
                                    <th>Sigla</th>
                                    <th>Nome do Evento</th>
                                    <th>Programação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Evento e : ae) {%>
                                <tr>
                                    <td><%= e.getSigla()%></td>
                                    <td><a href="../ServletCentral?comando=CmdSelecionarEvento&id=<%=e.getId()%>" title=""><%= e.getNome()%></a></td>
                                    <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%=e.getId()%>" title="Programacao" > Visualizar</a> </td>
                                </tr>
                                <%}%>
                            </tbody>
                            <%}%>
                        </table>
                    </div>
                </center> 
                <p><a href="" title="" onclick="history.back();
                        return false;" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
