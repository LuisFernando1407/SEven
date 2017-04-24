<%-- 
    Document   : organ_listar_email_participantes
    Created on : 06/09/2012, 10:44:24
    Author     : gleyson
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
                        </select><label><a href="../org/organ_listar_participantes.jsp" style="margin-left: 3%">Voltar</a></label>
                    </form>
                

                        <br/>
                        <center>Email</center>
                           <br/>
                           
                            <% for (int i = 0; i < parts.size(); i++) {
                                            Participante p = parts.get(i);%>
                                            
                                            <li style="color:#666; display: block">
                                <label > <%=p.getUsuario().getEmail()%></label>
                            </li><br/>
                                                        <%}%>
                        
                </fieldset>
            </div>
        </div>
    </body>

</html>