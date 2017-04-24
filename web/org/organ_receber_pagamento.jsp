<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
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
    <%
                InscricaoService is = new InscricaoService();
                Inscricao inscrito = (Inscricao) session.getAttribute("receberpagamentodoparticipante");
                session.removeAttribute("receberpagamentodoparticipante");
                String status = inscrito.isConfirmada() ? "pago" : "não pago";
    %>
    <script type="text/javascript" >
        function confimar(){
            if(confirm("Deseja realmente confirmar o recebimento do pagamento?")){
                return true;
            }
            return false;
        }
    </script>
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
                <h1 class="titulo">Receber Pagamento</h1>
                <p>Nome: <%=inscrito.getParticipante().getUsuario().getNome()%></p>
                <p>Email: <%=inscrito.getParticipante().getUsuario().getEmail()%></p>
                <p>Fone: <%=inscrito.getParticipante().getUsuario().getFone()%></p>
                <p>Atividade(s):</p>
                <%for (Atividade insc : inscrito.getAtividades()) {%>
                <p><%=insc.getNome()%>
                    <%for (Horario h : insc.getHorarios()) {%><%--Exibe horários de cada atividade--%>
                    <br/>
                    (<%=h.printHorario()%>)
                    <%}%>
                </p>
                <%}%>
                <p>Valor da Inscrição: <%=is.getPrecoInscricao(inscrito)%> R$</p>
                <p>Status do pagamento: <%= status%></p>
                <form action="../ServletCentral?comando=CmdReceberPagamento&id_confirm=<%=inscrito.getId()%>" method="post" class="cadastro">
                    <!--<%session.setAttribute("confirmado", inscrito);%>-->
                    <input type="submit" name="ok" value="Receber Pagamento" class="button" onclick="return confimar()" style="width: 140px;" />
                    <a href="../ServletCentral?comando=CmdBuscarParticipantedeEvento" title="" class="voltarCadastro">Voltar</a>
                </form>
                <%session.setAttribute("confirmado", null);%>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
