<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,java.util.List, br.ufc.pet.evento.TipoAtividade,br.ufc.pet.evento.ResponsavelAtividade,br.ufc.pet.evento.Horario,br.ufc.pet.evento.Atividade,br.ufc.pet.evento.Evento" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
        <script type="text/javascript">
            function forceSubmitListarRelatoriosAtividades(formName) {
                document.forms[formName].action = "organ_add_responsavel.jsp";
                document.forms[formName].submit();
            }
        </script>
        <title>Centro de Controle :: Administrador</title>
        <style type="text/css">
            #content form.cadastro input {
                width: 200px;
            }
        </style>
    </head>
    <body>
        <%
            Evento evento = (Evento) session.getAttribute("evento");
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
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Atividade</h1>
                <%@include file="/error.jsp" %>
                <form name="formAddAtividade" action="../ServletCentral?comando=CmdAdicionarAtividade" method="post" class="cadastro">
                    <fieldset>

                        <h2 class="titulo">Responsáveis da atividade</h2>
                        <a href="#" onclick="forceSubmitListarRelatoriosAtividades('formAddAtividade')">Adicionar Responsavel</a><br>
                            <%if (resps != null && !resps.isEmpty()) {%>
                            <table id="data_table" border="1" style="margin-top: 10px;">                           
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
                                    <tr>
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
                            <h2 class="titulo">Dados da atividade</h2>
                            <label class="clear">Nome:</label>
                            <input type="text" name="nome_atividade" style="width: 400px;" value="<%=nome%>"/><br />
                            <label>Local:</label><br />
                            <input type="text" name="local" style="width: 400px;" value="<%=local%>"/><br />
                            <label>Vagas:</label><br />
                            <input type="text" maxlength="5" style="width: 400px;" onkeypress="return validaNumerosSilencioso(event)" name="vagas" value="<%=vagas%>"/><br />

                            <label class="clear">É inscritível? (Aceitará inscrições de participantes?):</label>
                            <% if (a == null) {%>
                            <input type="radio" name="inscritivel" value="SIM" class="radio" checked="checked"/><label style="float: left">SIM</label><br/>
                            <input type="radio" name="inscritivel" value="NAO" class="radio"/><label style="float: left">NAO</label>
                            <%} else {
                                String checkedSIM = "";
                                String checkedNAO = "";
                                if (a.isAceitaInscricao() == true) {
                                    checkedSIM = "checked=\"checked\"";
                                } else {
                                    checkedNAO = "checked=\"checked\"";
                                }
                            %>
                            <input type="radio" name="inscritivel" value="SIM" class="radio" <%=checkedSIM%>/><label style="float: left">SIM</label><br/>
                            <input type="radio" name="inscritivel" value="NAO" class="radio"  <%=checkedNAO%>/><label style="float: left">NAO</label>
                            <%}%>
                            <h2 class="titulo">Tipo da atividade</h2>
                            <label style="float: left">Tipo:</label><br />
                            <% for (TipoAtividade ta : tas) {%>
                            <% if (a != null && (a.getTipo().getId().compareTo(ta.getId()) == 0)) {%>
                            <input type="radio" name="tipo_id" value="<%=ta.getId()%>" class="radio"checked="checked"/><label style="float: left"><%=ta.getNome()%></label><br/>
                            <%} else {%>
                            <input type="radio" name="tipo_id" value="<%=ta.getId()%>" class="radio"/><label style="float: left"><%=ta.getNome()%></label><br/>
                            <%}
                            }%>
                            <h2 class="titulo">Horários da atividade</h2>
                            <label>Horários:</label><br />
                            <table class="data_table" border="1" style="margin-top: 10px;">
                                <thead> <tr><th> Marcar</th><th>Horarios Disponiveis</th> </tr> </thead>
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
                                    <tr style="white-space: nowrap; width: 50px;">
                                        <td ><input type="checkbox" name="cb_horario_<%=h1.getId()%>" value="ON" <%=checked%> class="chk_box" style="margin-left: 15px;" /></td><td><label><%=h1.printHorario()%></label></td>
                                    </tr>
                                    <%} else {%>
                                    <tr style="white-space: nowrap; width: 50px;"><td ><input type="checkbox" name="cb_horario_<%=h1.getId()%>" value="ON" class="chk_box" style="margin-left: 15px;" /></td><td ><label><%=h1.printHorario()%></label></td></tr>
                                                <%}
                                            }%>
                                </tbody>
                            </table>                       
                            <br>
                                </fieldset>
                                <input type="submit" value="Enviar" class="button" onclick="return confirm('Deseja realmente enviar esses dados?')" />
                                <a href="" title="" onclick="history.back();
                            return false;" class="voltarCadastro">Voltar</a>
                                </form>
                                </div>
                                <div id="footer"></div>
                                </div>
                                </body>
                                </html>
