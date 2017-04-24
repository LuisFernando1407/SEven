<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.MovimentacaoFinanceira"%>
<%@page import="java.util.*"%>
<%@page import="br.ufc.pet.util.UtilSeven"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%
                String addmov = (String) session.getAttribute("addmovimentacaofinanceira");
                MovimentacaoFinanceira movf = (MovimentacaoFinanceira) session.getAttribute("atualizarmovimentacaofinanceira");
                String comand = "Adicionar Movimentação Financeira";
                String descricao = "";
                String valor = "";
                String data = "";
                String tipo = "";
                if (movf != null) {
                    comand = "Alterar Movimentação Financeira";
                    descricao = movf.getDescricao();
                    valor = Double.toString(movf.getValor());
                    data = UtilSeven.treatToString(movf.getData());
                    tipo = movf.getTipo();
                }
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
                <h1 class="titulo"><%=comand%></h1>
                <form action="../ServletCentral?comando=CmdAddMovimentacaoFinanceira" method="post" class="cadastro">
                    <fieldset>
                        <label>Descrição:</label><br />
                        <input type="text" name="descrição" value="<%=descricao%>"/><br />
                        <label>Valor:</label><br />
                        <input type="text" name="valor" value="<%=valor%>"/><br />
                        <label>Data:</label><br />
                        <input type="text" maxlength="10" name="data" onkeypress="return formataData(this, event)" value="<%=data%>"/><br />
                        <label style="float: left">Tipo:</label><br />
                        <%if (tipo.isEmpty()) {%>
                        <input type="radio" name="tipo_movimentacaofinanceira" value="credito" class="radio" />
                        <label style="float: left">Credito</label><br />
                        <input type="radio" name="tipo_movimentacaofinanceira" value="debito" class="radio" />
                        <label style="float: left">Debito</label><br/>

                        <%} else if (tipo.compareTo("credito") == 0) {%>
                        <input type="radio" name="tipo_movimentacaofinanceira" value="credito" class="radio" checked="checked"/>
                        <label style="float: left">Credito</label><br/>
                        <input type="radio" name="tipo_movimentacaofinanceira" value="debito" class="radio" />
                        <label style="float: left">Debito</label><br/>

                        <%} else {%>
                        <input type="radio" name="tipo_movimentacaofinanceira" value="credito" class="radio" />
                        <label style="float: left">Credito</label><br/>
                        <input type="radio" name="tipo_movimentacaofinanceira" value="debito" class="radio" checked="checked"/>
                        <label style="float: left">Debito</label><br/>

                        <%}%>
                        <%if (addmov == "vazio") {%>
                        <label><center>***Verifique se não há dados em branco ou algum dado incorreto***</center></label><br />
                        <%}%>                        
                        <%if (addmov == "erro") {%>
                        <label><center>***Erro ao adicionar a movimentação***</center></label><br />
                        <%}%>
                        <%session.setAttribute("addmovimentacaofinanceira", null);%>
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" />
                    <a href="../ServletCentral?comando=CmdListarMovimentacaoFinanceira" class="voltarCadastro" title="">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
<!-- onclick="history.back(); return false;" class="voltar"-->