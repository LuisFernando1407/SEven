<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : ismaily
--%>
<%-- 
    Document   : organ_listar_atividades_download
    Modified in : 07/05/2017, 23:08:57
    Author     : João Mateus
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
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp" %>

            <div id="content">
                <%@include file="/error.jsp"%>
                <h1 class="titulo">Lista de Atividades do Evento</h1>

                <form action="" >
                    <input type="hidden" name="comando"/>
                    <input type="hidden" name="idAtv"/>

                    <%if (ats == null || ats.size() == 0) {%>
                    <label><center>Sem Atividades no momento</center></label><br />
                            <%} else {%>
                    <table id="data_table" class="table table-hover text-center">
                        <thead>
                            <tr><th>Atividades</th></tr>
                        </thead>
                        <tbody>
                            <% for (Atividade at : ats) {%>
                            <tr>
                                <td><a href="../ServletCentral?comando=CmdRelatorioParticipanteAtividade&idAtv=<%=at.getId()%>"title=""><%=at.getNome()%></a></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </form>
                <a href="" title="" onclick="history.back(); return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
