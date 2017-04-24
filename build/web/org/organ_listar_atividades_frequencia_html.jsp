<%--
    Document   : organ_listar_atividades_download_html
    Created on : 03/02/2011, 10:28:50
    Author     : Welligton Abreu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Atividade" %>
<%@page import="br.ufc.pet.evento.Participante" %>
<%@page import="br.ufc.pet.evento.Horario" %>
<%@page import="br.ufc.pet.util.UtilSeven" %>

<%@page import="java.util.*"%>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%        Atividade at = (Atividade) session.getAttribute("atividade");
        ArrayList<Participante> parts = (ArrayList<Participante>) session.getAttribute("participantes");
        ArrayList<Horario> horarios = at.getHorarios();

        int horario = horarios.size();


    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <div id="content">
                <h1 class="titulo">Lista de Frequência</h1>

                <table class="extend">
                    <tr>
                        <td>Cod.:<%=at.getId()%></td>
                        <td>Local:<%=at.getLocal()%></td>
                        <td>Evento:<%=at.getEvento().getNome()%></td>
                    </tr>
                    <tr>
                        <td>Vagas:<%=at.getVagas()%></td>
                        <td>Tipo:<%=at.getTipo().getNome()%></td>
                        <td>Nome:<%=at.getNome()%></td>
                    </tr>
                </table>
                <table class="extend">
                    <%
                        for (int i = 0; i < horario; i++) {
                            String data = UtilSeven.treatToString(horarios.get(i).getDia());
                            int hInicial = horarios.get(i).getHoraInicial();
                            String horaInicial = "" + hInicial;
                            if (hInicial <= 9 && hInicial >= 0) {
                                horaInicial = "0" + hInicial;
                            }
                            int hFinal = horarios.get(i).getHoraFinal();
                            String horaFinal = "" + hFinal;
                            if (hFinal <= 9 && hFinal >= 0) {
                                horaFinal = "0" + hFinal;
                            }
                            int mInicial = horarios.get(i).getMinutoInicial();
                            String minInicial = "" + mInicial;
                            if (mInicial <= 9 && mInicial >= 0) {
                                minInicial = "0" + mInicial;
                            }
                            int mFinal = horarios.get(i).getMinutoFinal();
                            String minFinal = "" + mFinal;
                            if (mFinal <= 9 && mFinal >= 0) {
                                minFinal = "0" + minFinal;
                            }


                    %>
                    <tr>
                        <td>Data:<%=data%></td>
                        <td>Horário:<%=horaInicial + ":" + minInicial + " às " + horaFinal + ":" + minFinal%></td>
                    </tr>
                    <%}%>
                </table>
                <center>
                    <div style="width: 80%;">
                         <table id="data_table" class="extend">
                            <thead>
                                <tr>
                                    <th width="50px">N°</th>
                                    <th>Nome</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; parts != null && i < parts.size(); i++) {%>
                                <tr>
                                    <td><%=i + 1%></td>
                                    <%
                                        Participante p = parts.get(i);
                                    %>
                                    <td><%=p.getUsuario().getNome()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </center>
                <a href=""  style="float: left; margin-bottom: 10px"
                   title="" onclick="history.back();
                           return false;" class="voltarCadastro">Voltar</a>

            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
