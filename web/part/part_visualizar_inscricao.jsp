<%-- 
    Document   : part_visualizar_inscricao
    Created on : 16/07/2010, 00:01:24
    Author     : Caio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="br.ufc.pet.evento.Atividade"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="br.ufc.pet.evento.TipoAtividade"%>
<%@page import="br.ufc.pet.evento.Horario"%>
<%@page import="br.ufc.pet.services.InscricaoService"%>
<%@page import="br.ufc.pet.util.UtilSeven"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%          //pega inscrição a ser visualizada
                Inscricao i = (Inscricao) session.getAttribute("inscricao");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo Menu --%>
                <%@include file="part_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Visualizar Inscrição</h1>
                <h2 class="titulo" style="margin-bottom: 10px;">Verificação da Inscrição</h2>
                <br/>
                <%//formata as datas para exibição em texto
                            String data = UtilSeven.treatToLongString(i.getDataRealizada());
                            String datapg = UtilSeven.treatToLongString(i.getDataPagamento());
                %><fieldset>
                    <p>Evento: <%=i.getEvento().getNome()%></p>
                    <p>Participante: <%=i.getParticipante().getUsuario().getNome()%></p>
                    <p>Modalidade: <%=i.getModalidade().getTipo()%></p>
                </fieldset>
                <fieldset>
                    <p>Data: <%=data%></p>
                    <p>Prazo de pagamento: Até <%=datapg%></p>
                </fieldset>
                <fieldset>
                    <p>Atividades:</p>
                    <%for (Atividade a : i.getAtividades()) {%>
                    <p><%=a.getNome()%>
                        <%for (Horario h : a.getHorarios()) {%><%--Exibe horários de cada atividade--%>
                        <br/>
                        (<%=h.printHorario()%>)
                        <%}%>
                    </p>
                    <%}%>
                </fieldset>
                <%
                            InscricaoService IS = new InscricaoService();
                            String preco = UtilSeven.precoFormater(IS.getPrecoInscricao(i));
                %>
                <fieldset>
                    <p>Preço: <%=preco%></p>
                </fieldset>
                <form action="../ServletCentral?comando=CmdEditarInscricao" method="post" class="cadastro">
                    <input type="submit" value="Editar" class="button" />
                    <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>