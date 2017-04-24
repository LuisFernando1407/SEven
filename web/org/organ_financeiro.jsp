<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page import="br.ufc.pet.evento.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <%Evento e = (Evento) session.getAttribute("evento");%>
                <%if(e.isGratuito()){%>
                    <h1 class="titulo">Este é um evento gratuito.</h1>
                <%}else{%>
                    <div id="content_left">
                        <h1 class="titulo">Movimentações</h1>
                        <%if (session.getAttribute("todosPagamentosRecebidos") != null) {%>
                        <h4>Todas as inscrições tiveram seu pagamento realizado com sucesso.</h4>
                        <%}
                                session.removeAttribute("todosPagamentosRecebidos");%>
                        <div id="list">
                            <ul>
                                <li><a href="../ServletCentral?comando=CmdListarMovimentacaoFinanceira" title="">Movimentação Financeira</a></li>

                            </ul>
                        </div>
                    </div>
                    <div id="content_right">
                        <h1 class="titulo">Pagamentos</h1>
                        <h2 class="titulo">Receber Individual</h2>
                        <p><a href="organ_listar_pagamento.jsp" title="">Receber Pagamento de Inscrição Por Inscrição</a></p>
                        <p><a href="organ_listar_pagamento_part.jsp" title="">Receber Pagamento de Inscrição Por Participante</a></p>
                        <h2 class="titulo">Receber Todos</h2>
                        <p><a href="../ServletCentral?comando=CmdReceberPagamentoTodasInscricoes" title="" class="button2" onclick="return confirm('Deseja realmente efetuar esta operacao?')">Receber Pagamento de todas as Inscrições</a></p>
                    <br/>
                    </div>

                </div>
            
            <%}%>            
                        
            <div id="footer"></div>
        </div>
    </body>
</html>
