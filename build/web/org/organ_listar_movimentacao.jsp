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
    <%        br.ufc.pet.evento.Evento evento = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
        ArrayList<MovimentacaoFinanceira> movfs = evento.getMovimentacoesFinanceiras();
        String estado = (String) session.getAttribute("estado");
        session.removeAttribute("estado");
        Boolean permissao = (Boolean) session.getAttribute("permissao");
    %>
    <script type="text/javascript" >
        function confirmar() {
            if (<%=permissao%>) {
                if (confirm("Deseja realmente excluir essa movimentação financeira?"))
                    return true;
            } else {
                alert("Você não possui acesso?");
            }
            return false;
        }

        function permissao() {
            if (!<%=permissao%>) {
                alert("Você não possui acesso?");
                return false;
            }
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
                <h1 class="titulo">Movimentações Financeiras</h1>
                <%if (estado == "atualizado") {%>
                <h3>Atualização realizada com sucesso</h3>
                <%} else if (estado == "excluido") {%>
                <h3>Exclusão realizada com sucesso</h3>
                <%} else if (estado == "adicionado") {%>
                <h3>Adição realizada com sucesso</h3>
                <%}%>
                <p><a href="organ_add_movimentacao.jsp" title="Adicionar Organizador" onclick="return permissao()">Adicionar nova movimentação</a></p>
                <center>
                    <div style="width: 50%;">
                        <table id="data_table">
                            <thead>
                                <tr>
                                    <th>Descrição</th>
                                    <th>Tipo</th>
                                    <th>Data</th>
                                    <th>Valor</th>
                                    <th>Alterar / Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (MovimentacaoFinanceira mov : movfs) {%>
                                <tr>
                                    <td><%=mov.getDescricao()%></td>
                                    <td><%=mov.getTipo()%></td>
                                    <td><%=UtilSeven.treatToString(mov.getData())%></td>
                                    <td><%=mov.getValor()%></td>
                                    <td><a href="../ServletCentral?comando=CmdUpdateMovimentacaoFinanceira&id_mf=<%=mov.getId()%>" title="Alterar" onclick="return permissao()">Alterar</a> |
                                        <a href="../ServletCentral?comando=CmdExcluirMovimentacaoFinanceira&id_mf=<%=mov.getId()%>" title="Excluir"  onclick="return confirmar()">Excluir</a></td>
                                </tr>
                                <%}%>
                                <%session.setAttribute("alteradomovfinan", "sem_alteracao");%>
                            </tbody>
                        </table>
                    </div>
                </center>
                <%
                    // Calcula o total de creditos, debitos e o balanco.
                    String creditos = "00,00";
                    String debitos = "00,00";
                    String balanco = "00,00";
                    double cred = 0, deb = 0;
                    for (MovimentacaoFinanceira mov : movfs) {
                        if (mov.getTipo().equals("credito")) {
                            cred += mov.getValor();
                        }
                        if (mov.getTipo().equals("debito")) {
                            deb += mov.getValor();
                        }
                    }

                    creditos = String.format("%.2f", cred);
                    debitos = String.format("%.2f", deb);
                    balanco = String.format("%.2f", cred - deb);
                %>
                <br/>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Créditos: </td>
                            <td> <%=creditos%> </td>
                            <td>Débitos: </td>
                            <td> <%=debitos%> </td>
                            <td>Balanço: </td>
                            <td> <%=balanco%> </td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="organ_financeiro.jsp" title=""  class="voltar">Voltar</a></p><!--onclick="history.back(); return false;"-->
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
