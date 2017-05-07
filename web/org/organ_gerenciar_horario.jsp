<%-- 
    Document   : organ_gerenciar_horario
    Created on : 02/08/2010, 22:41:58
    Author     : Escritorio projetos
--%>
<%-- 
    Document   : organ_gerenciar_horario
    Modified in : 07/05/2017, 15:15:57
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="br.ufc.pet.evento.Horario,br.ufc.pet.util.UtilSeven" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%            br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
            ArrayList<Horario> horarios = (ArrayList<Horario>) session.getAttribute("horarios");
            session.removeAttribute("horario");
        %>
        <div id="container">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp"%>
                
            <div id="content">
                <%@include file="/error.jsp"%>
                <h1 class="titulo">Gerenciar Horários para atividades do evento <%=e.getNome()%></h1> 
                <table id="data_table" class="table table-hover text-center">
                    <%if (horarios == null || horarios.size() == 0) {%>
                    <label>Sem horarios no momento</label>
                        <%} else {%>
                    <thead>
                        <tr>
                            <th>Hora Inicial</th>
                            <th>Hora Final</th>                       
                            <th>Dia</th>
                            <th>Alterar | Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Horario horario : horarios) {%>
                        <tr>
                            <td><label><%=String.format("%02d", horario.getHoraInicial()) + " : " + String.format("%02d", horario.getMinutoInicial())%></label></td>
                            <td><label><%=String.format("%02d", horario.getHoraFinal()) + " : " + String.format("%02d", horario.getMinutoFinal())%></label></td>
                            <td><label><%=UtilSeven.treatToLongString(horario.getDia())%></label></td>
                            <td><a href="../ServletCentral?comando=CmdEditarHorario&hor_id=<%=horario.getId()%>" title="Alterar Atividade">Alterar</a> |
                                <a href="../ServletCentral?comando=CmdExcluirHorario&hor_id=<%=horario.getId()%>" title="Excluir Horario" onclick="return confirm('Tem certeza que deseja excluir esse horario?')">Excluir</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <% }%>

                </table>
                <a href="../ServletCentral?comando=CmdListarAtividades" title=""  class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                <a href="organ_add_horario.jsp" title="Adicionar um novo Horario" class="btn btn-default">Adicionar Horario</a>
            </div>          
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
