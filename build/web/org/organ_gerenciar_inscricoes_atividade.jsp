<%-- 
    Document   : organ_gerenciar_inscricoes_atividade
    Created on : 08/03/2011, 20:38:50
    Author     : Caio
--%>

<%@page import="br.ufc.pet.evento.Atividade"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.pet.evento.Organizador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%    br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
    Atividade a = (Atividade) session.getAttribute("atividade");
    Organizador organizador = (Organizador) session.getAttribute("user");
    ArrayList<Inscricao> inscricoesNaAtividade = (ArrayList<Inscricao>) session.getAttribute("inscAtiv");
    String estado = null;
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
    <title>Centro de Controle :: Organizador</title>
    <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
    <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../jquery/initDataTable.js"></script>
</head>
<body>
    <div id="container">
        <div id="top">
            <%-- Incluindo Menu --%>
            <%@include file="organ_menu.jsp" %>
        </div>
        <%@include file="/error.jsp"%>
        <div id="content">
            <h1 class="titulo">Visualizar as Inscrições na Atividade <%=a.getNome()%></h1>
            <h2 class="titulo">Lista de todos os inscritos na atividade:</h2>
            <%if (inscricoesNaAtividade == null || inscricoesNaAtividade.isEmpty()) {%>
            <p style="text-align: center;"><label>Não há inscrições cadastradas</label></p>
            <%} else {%>
            <table id="data_table" style="width: 100%;">
                <thead>
                    <tr>
                        <th>Nome do inscrito</th>
                        <th>Tipo</th>
                        <th>Atividades</th>
                        <th>Status do Pagamento</th>
                        <th>Editar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Inscricao i : inscricoesNaAtividade) {%>
                    <tr>
                        <td><%= i.getParticipante().getUsuario().getNome()%></td>
                        <td><%= i.getModalidade().getTipo()%></td>
                        <td>
                            <%for (Atividade at : i.getAtividades()) {%>
                            <a style="margin-right: 5px;" href="../ServletCentral?comando=CmdListarInscritosEmAtividade&aId=<%=at.getId()%>"><%=at.getNome()%></a>
                            <%}%>
                        </td>
                        <%
                            if (i.isConfirmada()) {
                                estado = "Efetuado";
                            } else {
                                estado = "Não Efetuado";
                            }
                        %>
                        <td><%=estado%></td>
                        <td><a href="" title="Visualizar/Editar">Visualizar/Editar</a></td>
                        <td><a href="../ServletCentral?comando=CmdOrganExcluirInscricao&iId=<%=i.getId()%>" onclick="return confirm('ATENÇÃO: Se você excluir uma inscrição que já foi paga ela não estará mais no sistema e não será possível recuperar a quantia paga. Também poderá causar a perda das vagas e dos certificados relacionados com esta inscrição. Tem certeza que dejesa excluir esta inscrição?');" title="Excluir">Excluir Inscrição</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%}%>
            <p><a href="../ServletCentral?comando=CmdGerenciarInscricoes&cod_evento=<%= e.getId()%>" class="voltar">Voltar</a></p>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>
