<%-- 
    Document   : organ_gerenciar_inscricoes
    Created on : 08/03/2011, 18:27:02
    Author     : Caio
--%>

<%@page import="br.ufc.pet.evento.ResponsavelAtividade"%>
<%@page import="br.ufc.pet.evento.Atividade"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="br.ufc.pet.evento.Organizador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%    br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
    Organizador organizador = (Organizador) session.getAttribute("user");
    ArrayList<Inscricao> inscricoesNoEvento = (ArrayList<Inscricao>) session.getAttribute("inscricoes");
    String estado = null;
    ArrayList<Atividade> ats = e.getAtividades();
%>
<html>
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
                <h1 class="titulo">Visualizar as Inscrições do Evento <%=e.getNome()%></h1>
                <h2 class="titulo">Lista de todos os inscritos no evento:</h2>
                <%if (inscricoesNoEvento == null || inscricoesNoEvento.isEmpty()) {%>
                <p style="text-align: center;"><label>Não há inscrições cadastradas</label></p>
                <%} else {%>
                <table class="data_table" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Nome do inscrito</th>
                            <th>Tipo</th>
                            <th>Atividades</th>
                            <th>Status do Pagamento</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            <th>Certificado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Inscricao i : inscricoesNoEvento) {%>
                        <tr>
                            <td><%= i.getParticipante().getUsuario().getNome()%></td>
                            <td><%= i.getModalidade().getTipo()%></td>
                            <td>
                                <%for (Atividade a : i.getAtividades()) {%>
                                <a style="margin-right: 5px;" href="../ServletCentral?comando=CmdListarInscritosEmAtividade&aId=<%=a.getId()%>"><%=a.getNome()%></a>
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
                            <td><a href="../ServletCentral?comando=CmdBuscarInscricao&id=<%=i.getId()%>" title="Visualizar/Editar">Visualizar/Editar</a></td>
                            <td><a href="../ServletCentral?comando=CmdOrganExcluirInscricao&iId=<%=i.getId()%>" onclick="return confirm('ATENÇÃO: Se você excluir uma inscrição que já foi paga ela não estará mais no sistema e não será possível recuperar a quantia paga. Também poderá causar a perda das vagas e dos certificados relacionados com esta inscrição. Tem certeza que dejesa excluir esta inscrição?');" title="Excluir">Excluir</a></td>
                            <td><a href="../ServletCentral?comando=CmdGerarCertificado&insc_id=<%=i.getId()%>" title="Gerar">Gerar</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <%}%>
                <h2 class="titulo">Listagem de inscritos por atividade (Selecione a atividade):</h2>
                <%if (ats == null || ats.size() == 0) {%>
                <center><label>Sem atividades no momento</label></center>
                    <%} else {%>
                <table class="data_table" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Tipo</th>
                            <th>Local</th>
                            <th>Responsável</th>
                            <th>Capacidade</th>
                            <th>N Inscritos</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%for (Atividade a : ats) {
                            if (a.isAceitaInscricao()) {%>
                        <tr>
                            <td><a href="../ServletCentral?comando=CmdListarInscritosEmAtividade&aId=<%=a.getId()%>"><%=a.getNome()%></a></td>
                            <td><%=a.getTipo().getNome()%></td>
                            <td><%=a.getLocal()%></td>
                            <% java.lang.StringBuffer sb = new java.lang.StringBuffer("");
                                for (ResponsavelAtividade ra : a.getResponsaveis()) {
                                    sb.append(ra.getUsuario().getNome());
                                    sb.append("<br>");
                                }%>
                            <td><%=sb.toString()%></td>                       
                            <td><%=a.getVagas()%></td>
                            <%
                                br.ufc.pet.services.InscricaoService IS = new br.ufc.pet.services.InscricaoService();
                                long vagasOcupadas = IS.getInscritosByAtividadeId(a.getId());
                            %>
                            <td><%=vagasOcupadas%></td>
                        </tr>
                        <%}
                        }%>
                    </tbody>
                </table>
                <%}%>
                <p><a href="organ_inscricoes.jsp" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
