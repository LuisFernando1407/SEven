<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : index
    Modified in : 
    Author     : 
--%>
<%@page import="br.ufc.pet.evento.Participante"%>
<%
    java.util.ArrayList<br.ufc.pet.evento.Evento> eventos = (java.util.ArrayList<br.ufc.pet.evento.Evento>) session.getAttribute("eventosAbertos");
    Participante part = (Participante) session.getAttribute("user");
    String nomeSaudacao = part.getUsuario().getNome().split(" ")[0];
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Centro de Controle :: Participante</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
    </head>
    <body>
        <div id="container">
            <%-- Incluindo Menu --%>
            <%@include file="part_menu.jsp" %>
            <div id="content">
                <div class="container col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <h1 class="titulo">Olá, <%= nomeSaudacao%></h1>
                    <p>Esta é a página inicial do Participante. Quando desejar retornar a esta página, clique na opção 'Home' no menu acima.</p>
                    <%@include file="../error.jsp" %>
                </div>
                <div class="container col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <h1 style="text-align: center; margin-top: 8.5px; font-size: 18px;"class="titulo">Tentando se inscrever em um evento? </h1>
                    <p class="text-center">Utilize o menu no topo da página ou solicite rapidamente uma nova inscrição clicando nos links rápidos abaixo!</p>
                    <%if (eventos == null || eventos.size() == 0) {%>
                    <label>Sem eventos abertos no momento</label>
                    <%} else {%>
                    <table id="data_table" class="table table-hover">
                        <thead>
                            <tr>
                                <th>Evento</th>
                                <th>Sigla</th>
                                <th>Programação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (br.ufc.pet.evento.Evento e : eventos) {%>
                            <tr>
                                <td> <a href="../ServletCentral?comando=CmdSelecionarEvento&id=<%=e.getId()%>"><%= e.getNome()%></a>  </td>
                                <td> <%= e.getSigla()%> </td>
                                <td> <a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%=e.getId()%>" title="Programacao" > Visualizar</a> </td>
                            </tr>
                            <% }%>
                        </tbody>
                        <% }%>

                    </table>
                    <br/>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
