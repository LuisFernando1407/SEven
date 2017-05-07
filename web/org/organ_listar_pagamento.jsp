<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : organ_listar_pagamento
    Modified in : 06/05/2017, 23:15:00
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        //ArrayList<Inscricao> participanteinscrito = (ArrayList)session.getAttribute("inscricoesdoevento");
        Inscricao participanteinscrito = (Inscricao) session.getAttribute("inscricoesdoevento");
        String mensagem = (String) session.getAttribute("mensagem");
        session.removeAttribute("inscricoesdoevento");
        session.removeAttribute("mensagem");

        session.setAttribute("pag", "1");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script type="text/javascript" src="../Script.js"></script>
    </head>
    <body>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp" %>

            <div id="content">
                <h1 class="titulo">Recebimento de Pagamentos de Inscrição</h1>
                <div class="row"> 
                    <form style="width: 290px;" action="../ServletCentral?comando=CmdBuscarParticipantedeEvento" method="post" class="center-block form-inline">
                        <div class="form-group"><input type="text" onkeypress="return validaNumerosSilencioso(event)" name="inscricaobuscar" class="form-control" placeholder="Número da inscrição"/></div>
                        <div class="form-group"><input type="submit" value="Buscar" class="btn btn-default" /></div>
                    </form>
                    <br/>
                </div>
                <%if (mensagem == "naoencontrado") {%>
                <h6 style=" color: red; "align="center">Inscrição não encontrada</h6>
                <%} else if (mensagem == "vazio") {%>
                <h6 style=" color: red; "align="center">Preencha o número da Inscricao</h6>
                <%} else {%>
                <%if (participanteinscrito != null) {%>
                <table class="table table-hover">
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
                <a href="organ_financeiro.jsp" title="" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a><!--onclick="history.back(); return false;"-->
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
