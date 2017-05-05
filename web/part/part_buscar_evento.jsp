<%--
    Document   : part_buscar_evento
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : part_buscar_evento
    Modified in : 04/05/2017, 20:55:07
    Author     : João Mateus 
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
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
    </head>
    <body>
        <div id="container">
            
                <%-- Incluindo Menu --%>
                <%@include file="part_menu.jsp" %>
            
            <div id="content">
                <%@include file="/error.jsp"%>
                <h1 class="titulo">Selecionar Evento para Inscrição</h1>
                <center>
                    <div style="width: 50%;">

                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Eventos abertos</div>
                            <div class="panel-body">
                                <table id="data_table" class="table table-hover">
                                    <% if (ae == null || ae.isEmpty()) {%>
                                    <label>Não há eventos disponíveis</label>
                                    <%} else {%>
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
                                            <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%=e.getId()%>" title="Programacao" ><span class="text-uppercase label label-info">Visualizar</span></a> </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    <%}%>
                                </table>
                            </div>
                        </div>
                    </div>
                            </center> 
                            <a href="" title="" onclick="history.back();return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span>Voltar</a>
                        </div>
                    </div>
                    <div class="footer-top">        
                        <%@include file="../footer.jsp" %>
                    </div>
                    </body>
                    </html>
