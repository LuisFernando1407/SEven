<%-- 
    Document   : org_listar_participantes
    Created on : 05/03/2011, 17:08:45
    Author     : Escritorio projetos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, br.ufc.pet.evento.Participante,br.ufc.pet.evento.Evento,br.ufc.pet.evento.Atividade" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function forceSubmitListarRelatoriosAtividades(formName){      
                document.forms[formName].action = "../ServletCentral?comando=CmdListarParticipantes";
                document.forms[formName].submit();
            }
        </script>
        <title>Lista de Participantes Inscritos</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
    </head>
    <%--sComboPeriodo = "<select name=\"periodo\" onchange=\"forceSubmitCarregarTurmasPeriodo(\'form_avalicao\');\">";--%>
    <%  ArrayList<Participante> parts = (ArrayList<Participante>) session.getAttribute("listPartic");
                br.ufc.pet.services.AtividadeService ativService = new br.ufc.pet.services.AtividadeService();
                Evento ev = (Evento) session.getAttribute("evento");
                Long ativId = (Long) session.getAttribute("atividadeSelect");
                session.removeAttribute("atividadeSelect");

    %>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <fieldset><form name="formListarAtividade" method="POST">
                        Filtrar Por Atividade:
                        <select name="ativEscolhida" style="width: 300px;" onchange="forceSubmitListarRelatoriosAtividades('formListarAtividade')">
                            <option value="null">Todas as inscricoes</option>
                            <% for (Atividade a : ativService.getAtividadeByEventoId(ev.getId())) {
                                            if (ativId != null && ativId.compareTo(a.getId()) == 0) {%>
                            <option selected="selected" value="<%= a.getId()%>"><%=a.getNome()%></option>
                            <%} else if (a.isAceitaInscricao()) {%>
                            <option value="<%= a.getId()%>"><%=a.getNome()%></option>
                            <%}
                                        }%>
                        </select><label><a href="../org/organ_listar_email_participantes.jsp" style="margin-left: 3%">Ver apenas Email</a></label>
                    </form>
                </fieldset
                <fieldset>
                    <% if (parts != null && !parts.isEmpty()) {%>
                    <table id="data_table" align="left" style="width: 100%; ">
                        <thead>
                            <tr>
                                <th>Nº</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Inscricao Confirmada</th>
                                <th>Atividades</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < parts.size(); i++) {
                                     Participante p = parts.get(i);%>
                            <tr>
                                <td><%=i + 1%></td>
                                <td><%=p.getUsuario().getNome()%></td>
                                <td><%=p.getUsuario().getEmail()%></td>
                                <td><%=(p.getInscricoes().size() > 0) ? p.getInscricaoByEvento(ev.getId()).confimadaToString() : "0"%></td>
                                <td><%=(p.getInscricoes().size() > 0) ? p.getInscricaoByEvento(ev.getId()).getAtividades().size() : "0"%></td>
                            </tr>
                            <%}
                             } else {%>
                        <p>Nenhuma inscricao para essa atividade no momento!</p>

                        <%}%>
                        </tbody>
                    </table>
                </fieldset>
                <a href=""  style="float: left; margin-bottom: 10px"
               title="" onclick="history.back();
                            return false;" class="voltarCadastro">Voltar</a>
            </div>
        </div>      
    </body>

</html>