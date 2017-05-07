<%--
    Document   : organ_add_atividades
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : organ_add_atividades
    Modified in : 07/05/2017, 01:57:34
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,java.util.List, br.ufc.pet.evento.TipoAtividade,br.ufc.pet.evento.ResponsavelAtividade,br.ufc.pet.evento.Horario,br.ufc.pet.evento.Atividade,br.ufc.pet.evento.Evento" %>
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
        <script type="text/javascript">
            function forceSubmitListarRelatoriosAtividades(formName) {
                document.forms[formName].action = "organ_add_responsavel.jsp";
                document.forms[formName].submit();
            }
        </script>
        <style type="text/css">
            #content form.cadastro input {
                width: 200px;
            }
        </style>
    </head>
    <body>
        <%            Evento evento = (Evento) session.getAttribute("evento");
            ArrayList<TipoAtividade> tas = br.ufc.pet.util.UtilSeven.getTiposDeAtividadeByEventoId(evento.getId());
            ArrayList<ResponsavelAtividade> resps = (ArrayList<ResponsavelAtividade>) session.getAttribute("responsaveisEscolhidos");
            Atividade a = (Atividade) session.getAttribute("atividade");
            Atividade ativTemp = (Atividade) session.getAttribute("atividadeTemp");
            session.removeAttribute("atividadeTemp");
            String nome = "";
            String local = "";
            String vagas = "";

            if (a != null) {
                nome = a.getNome();
                local = a.getLocal();

                vagas = "" + a.getVagas();
            } else if (ativTemp != null) {
                nome = ativTemp.getNome();
                local = ativTemp.getLocal();
                vagas = "" + ativTemp.getVagas();
            }
        %>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp" %>

            <div id="content">
                <%@include file="/error.jsp" %>
                <h1 class="titulo">Atividade</h1>

                <form name="formAddAtividade" action="../ServletCentral?comando=CmdAdicionarAtividade" method="post">

                    <div class="panel panel-default space-top">
                        <div class="panel-cor panel-heading text-center">Responsáveis da atividade</div>
                        <div class="panel-body text-center">
                            <%if (resps != null && !resps.isEmpty()) {%>
                            <table id="data_table" class="table table-hover">                           
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Remover</th>
                                        <th>Alterar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (ResponsavelAtividade resp : resps) {%>
                                    <tr class="text-center">
                                        <td><label><%=resp.getUsuario().getNome()%></label></td>
                                        <td><a href="../ServletCentral?comando=CmdRemoverResponsavelAtividade&usuario_id=<%=resp.getUsuario().getId()%>" onclick="return confirm('Tem certeza que deseja excluir esse responsavel?')">Excluir</a></td>
                                        <td><a href="../ServletCentral?comando=CmdSelecionarResponsavelEdicao&usuario_id=<%=resp.getUsuario().getId()%>">Editar</a></td>
                                    </tr>
                                    <%}
                                    %>
                                </tbody>
                            </table>
                            <%} else {%>
                            <p>Nenhum responsável no momento</p>
                            <%}%>
                        </div>
                    </div>

                    <a href="#" onclick="forceSubmitListarRelatoriosAtividades('formAddAtividade')" class="btn btn-default pull-right">Adicionar Responsável</a><br/><br/>

                    <div class="panel panel-default space-top">
                        <div class="panel-cor panel-heading text-center">Dados da atividade</div>
                        <div class="panel-body">
                            <div class="col-lg-12 space-top">
                                <div class="form-group">
                                    <label>Nome:</label>
                                    <input type="text" name="nome_atividade" value="<%=nome%>" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Local:</label>
                                    <input type="text" name="local" value="<%=local%>" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Vagas:</label><br />
                                    <input type="text" maxlength="5" onkeypress="return validaNumerosSilencioso(event)" name="vagas" value="<%=vagas%>" class="form-control"/>
                                </div>

                                <label>É inscritível? (Aceitará inscrições de participantes?):</label><br/>
                                <div class="radio-inline">
                                    <% if (a == null) {%>
                                    <input type="radio" name="inscritivel" value="SIM" class="radio" checked="checked"/><label>Sim</label><br/>
                                    <input type="radio" name="inscritivel" value="NAO" class="radio"/><label>Não</label>
                                    <%} else {
                                        String checkedSIM = "";
                                        String checkedNAO = "";
                                        if (a.isAceitaInscricao() == true) {
                                            checkedSIM = "checked=\"checked\"";
                                        } else {
                                            checkedNAO = "checked=\"checked\"";
                                        }
                                    %>
                                    <input type="radio" name="inscritivel" value="SIM" class="radio" <%=checkedSIM%>/><label>Sim</label><br/>
                                    <input type="radio" name="inscritivel" value="NAO" class="radio"  <%=checkedNAO%>/><label>Não</label>
                                    <%}%>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default space-top">
                        <div class="panel-cor panel-heading text-center">Tipo da atividade</div>
                        <div class="panel-body">
                            <div class="col-lg-12 space-top">
                                <label>Tipo:</label><br />
                                <div class="radio-inline">
                                    <% for (TipoAtividade ta : tas) {%>
                                    <% if (a != null && (a.getTipo().getId().compareTo(ta.getId()) == 0)) {%>
                                    <input type="radio" name="tipo_id" value="<%=ta.getId()%>" class="radio" checked="checked"/><label><%=ta.getNome()%></label>
                                        <%} else {%>
                                    <input type="radio" name="tipo_id" value="<%=ta.getId()%>" class="radio"/><label><%=ta.getNome()%></label>
                                        <%}
                                            }%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default space-top">
                        <div class="panel-cor panel-heading text-center">Horários da atividade</div>
                        <div class="panel-body">
                            <div class="col-lg-12 space-top">
                                <label>Horários:</label><br />
                                <table class="table table-hover text-center">
                                    <thead> 
                                        <tr>
                                            <th>Marcar</th>
                                            <th>Horarios Disponiveis</th> 
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Horario> horarios = br.ufc.pet.util.UtilSeven.getHorariosByEvento(evento.getId());
                                            java.util.Collections.sort(horarios);
                                            for (Horario h1 : horarios) {%>

                                        <% String checked = "";
                                            if (a != null) {
                                                for (Horario h2 : a.getHorarios()) {
                                                    if (h1.isEqual(h2)) {
                                                        checked = "checked=\"checked\"";
                                                    }%>
                                        <%}%>
                                        <tr>
                                            <td><input type="checkbox" name="cb_horario_<%=h1.getId()%>" value="ON" <%=checked%> class="chk_box"/></td>
                                            <td><label><%=h1.printHorario()%></label></td>
                                        </tr>
                                        <%} else {%>
                                        <tr>
                                            <td><input type="checkbox" name="cb_horario_<%=h1.getId()%>" value="ON" class="chk_box"/></td>
                                            <td><label><%=h1.printHorario()%></label></td>
                                        </tr>
                                        <%}
                                                        }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="Enviar" class="btn btn-default pull-right" onclick="return confirm('Deseja realmente enviar esses dados?')" />
                    <a href="" title="" onclick="history.back();return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
