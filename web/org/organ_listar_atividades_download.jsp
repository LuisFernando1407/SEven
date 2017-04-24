<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : ismaily
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Atividade" %>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        ArrayList<Atividade> ats = (ArrayList<Atividade>) session.getAttribute("atividades");

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
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content" style="text-align: center;">
                <h1 class="titulo">Lista de Atividades do Evento</h1>
                <div id="list">
                    <form action="" >
                        <input type="hidden" name="comando"/>
                        <input type="hidden" name="idAtv"/>

                        <%@include file="/error.jsp"%>

                        <%if (ats == null || ats.size() == 0) {%>
                        <label><center>Sem Atividades no momento</center></label><br />
                        <%} else {%>
                        <table id="data_table">
                            <thead>
                                <tr><th>Atividades</th></tr>
                            </thead>
                            <tbody>
                                <% for (Atividade at : ats) {%>
                                    <tr><td><a href="../ServletCentral?comando=CmdRelatorioParticipanteAtividade&idAtv=<%=at.getId()%>"title=""><%=at.getNome()%></a></td></tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%}%>
                    </form>
                </div>
                <a href=""  style="float: left; margin-bottom: 10px"
               title="" onclick="history.back();
                            return false;" class="voltarCadastro">Voltar</a>
             </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
