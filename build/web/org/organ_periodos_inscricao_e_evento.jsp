<%-- 
    Document   : organ_periodos_inscricao_e_evento
    Created on : 09/03/2011, 17:36:31
    Author     : Franklin
--%>

<%@page import="br.ufc.pet.util.UtilSeven"%>
<%@page import="br.ufc.pet.evento.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript"  language="javascript" src="../Script.js"></script>
        <title>Modificar Período de Inscrição e do Evento</title>
    </head>
    <body>
        <%
            Evento evento = (Evento)session.getAttribute("evento");

            String inicioEvento = (String)session.getAttribute("inicioEvento");
            session.removeAttribute("inicioEvento");
            if(inicioEvento==null){
                inicioEvento=UtilSeven.treatToString(evento.getInicioPeriodoEvento());
            }

            String fimEvento = (String)session.getAttribute("fimEvento");
            session.removeAttribute("fimEvento");
            if(fimEvento==null){
                fimEvento=UtilSeven.treatToString(evento.getFimPeriodoEvento());
            }

            String inicioInscricao = (String)session.getAttribute("inicioInscricao");
            session.removeAttribute("inicioInscricao");
            if(inicioInscricao==null){
                inicioInscricao=UtilSeven.treatToString(evento.getInicioPeriodoInscricao());
            }

            String fimInscricao = (String)session.getAttribute("fimInscricao");
            session.removeAttribute("fimInscricao");
            if(fimInscricao==null){
                fimInscricao=UtilSeven.treatToString(evento.getFimPeriodoInscricao());
            }

        %>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Gerenciar Períodos de Inscrição e Evento</h1>
                <div id="content_left">
                    <%@include file="/error.jsp" %>
                    <label style="font-size: 8pt; color: gray; font-style: normal;"> Digite apenas números. A data ficará no seguinte formato dd/mm/aaaa</label><br/>
                    <form action="../ServletCentral?comando=CmdAlterarPeriodoInscricaoeEvento" method="POST" class="cadastro">
                        <label>Inicio do Evento: </label><br/>
                        <input type="text" name="inicioEvento" maxlength="10" value="<%=inicioEvento%>" onkeypress="return formataData(this,event)"><br/>
                        <label>Fim do Evento: </label><br/>
                        <input type="text" name="fimEvento" maxlength="10" value="<%=fimEvento%>" onkeypress="return formataData(this,event)"><br/>
                        <label>Inicio das Incrições: </label><br/>
                        <input type="text" name="inicioInscricao" maxlength="10" value="<%=inicioInscricao%>" onkeypress="return formataData(this,event)"><br/>
                        <label>Fim das Inscrições: </label><br/>
                        <input type="text" name="fimInscricao" maxlength="10" value="<%=fimInscricao%>" onkeypress="return formataData(this,event)">

                        <input type="submit" value="Enviar" class="button" onclick="return confirm('Deseja realmente executar essa modificação?')" /><br/>
                        <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a><br />
                    </form>
                    
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
