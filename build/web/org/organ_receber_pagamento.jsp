<%--
    Document   : organ_receber_pagamento
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : organ_receber_pagamento
    Modified in : 06/05/2017, 23:39:39
    Author     : João Mateus
--%>

<%@page import="br.ufc.pet.services.InscricaoService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="br.ufc.pet.evento.Atividade"%>
<%@page import="br.ufc.pet.evento.Horario"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        InscricaoService is = new InscricaoService();
        Inscricao inscrito = (Inscricao) session.getAttribute("receberpagamentodoparticipante");
        session.removeAttribute("receberpagamentodoparticipante");
        String status = inscrito.isConfirmada() ? "pago" : "não pago";
    %>
    <script type="text/javascript" >
        function confimar() {
            if (confirm("Deseja realmente confirmar o recebimento do pagamento?")) {
                return true;
            }
            return false;
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
    </head>
    <body>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp" %>

            <div id="content">
                <div class="panel panel-default space-top">
                    <div class="panel-cor panel-heading text-center">Receber Pagamento</div>
                    <div class="panel-body">
                        <div class="col-lg-12 space-top center-block">
                            <label>Nome: </label><%=inscrito.getParticipante().getUsuario().getNome()%><br/>
                            <label>Email: </label><%=inscrito.getParticipante().getUsuario().getEmail()%><br/>
                            <label>Fone:</label> <%=inscrito.getParticipante().getUsuario().getFone()%><br/>
                            <label>Atividade(s):</label>
                            <%for (Atividade insc : inscrito.getAtividades()) {%>
                            <br/>
                            <label><%=insc.getNome()%>:</label>
                            <%for (Horario h : insc.getHorarios()) {%><%--Exibe horários de cada atividade--%>
                            (<%=h.printHorario()%>)
                            <%}%>
                            <%}%>
                            <br/>
                            <label>Valor da Inscrição: </label><%=is.getPrecoInscricao(inscrito)%> R$<br/>
                            <label>Status do pagamento: </label><%= status%><br/>
                        </div>
                    </div>
                </div>
                <form action="../ServletCentral?comando=CmdReceberPagamento&id_confirm=<%=inscrito.getId()%>" method="post" class="center-block">
                    <!--<%session.setAttribute("confirmado", inscrito);%>-->
                    <a href="../ServletCentral?comando=CmdBuscarParticipantedeEvento" title="" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                    <input type="submit" name="ok" value="Receber Pagamento" class="btn btn-default" onclick="return confimar()" />
                </form>
                <%session.setAttribute("confirmado", null);%>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
