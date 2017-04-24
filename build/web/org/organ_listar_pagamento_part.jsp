<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="br.ufc.pet.evento.Evento"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%
                //ArrayList<Inscricao> participanteinscrito = (ArrayList)session.getAttribute("inscricoesdoevento");
                Inscricao participanteinscrito = (Inscricao) session.getAttribute("inscricoesdoevento");
                String mensagem = (String) session.getAttribute("mensagem");
                session.removeAttribute("inscricoesdoevento");
                session.removeAttribute("mensagem");
                
                session.setAttribute("pag", "2");

    %>

    <%
            br.ufc.pet.services.EventoService es = new br.ufc.pet.services.EventoService();
            java.util.ArrayList<br.ufc.pet.evento.Evento> eventos = es.buscarEventosAbertos();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
        <script type="text/javascript" src="../Script.js"></script>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                 <%@include file="/error.jsp" %>
                <h1 class="titulo">Recebimento de Pagamentos de Inscrição</h1>
                <form style="width: 290px;" action="../ServletCentral?comando=CmdBuscarParticipantePorEmail" method="post" class="box_destaque cadastro">


                    <fieldset>
                        <label>Email do Participante</label><br />
                        <input type="text" name="email" class="buscar"/>
                        <input type="submit" value="Buscar" class="button" /><br />
                    </fieldset>
                </form>
                <%if (mensagem == "naoencontrado") {%>
                <h6 style=" color: red; "align="center">Inscrição não encontrada</h6>
                <%} else if (mensagem == "vazio") {%>
                <h6 style=" color: red; "align="center">Preencha o número da Inscricao</h6>
                <%} else {%>
                <%if (participanteinscrito != null) {%>
                <table>
                    <tr>
                        <th>Inscrição</th>
                        <th>Nome</th>
                        <th>Status</th>
                    </tr>
                    <%//for(Inscricao insc : participanteinscrito){%>
                    <tr>
                        <td><%=participanteinscrito.getId()%></td>
                        <%if (participanteinscrito.isConfirmada()) {%>
                        <td><%=participanteinscrito.getParticipante().getUsuario().getNome()%></td>
                        <% } else {%>
                        <td><a href="../ServletCentral?comando=CmdReceberPagamento&id_inscricao=<%=participanteinscrito.getId()%>" title="" ><%=participanteinscrito.getParticipante().getUsuario().getNome()%></a></td>
                        <%}%>
                        <td><%=participanteinscrito.isConfirmada() ? "Pago" : "Não pago"%></td>
                    </tr>
                    <%//}%>
                </table>
                <%}%>
                <%}%>
                <p><a href="organ_financeiro.jsp" title=""  class="voltar">Voltar</a></p><!--onclick="history.back(); return false;"-->
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
