<%-- 
    Document   : organ_gerenciar_tipo_ativ
    Created on : 03/09/2010, 15:44:32
    Author     : Escritorio projetos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="br.ufc.pet.evento.TipoAtividade, br.ufc.pet.util.UtilSeven" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
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
        <%            br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
            ArrayList<TipoAtividade> tipoAtivs = (ArrayList<TipoAtividade>) session.getAttribute("tiposAtividades");
            session.removeAttribute("tipoAtividade");
        %>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp"%>
            </div>
            <div id="content">
                <h1 class="titulo">Gerenciar os Tipos de Atividades do evento <%=e.getNome()%></h1>
                <%@include file="/error.jsp"%>


                <p><a href="organ_add_tipo_ativ.jsp" title="Adicionar um novo Tipo de Atividade">Adicionar Tipo Atividade</a></p>
                <center>
                    <div style="width: 50%; ">
                        <table id="data_table">
                            <%if (tipoAtivs == null || tipoAtivs.size() == 0) {%>
                            <center><label>Sem Tipos de Atividade Cadastrados no momento</label></center>
                                <%} else {%>
                            <thead>
                                <tr>                        
                                    <th>Nome</th>
                                    <th>Alterar | Excluir</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%for (TipoAtividade ta : tipoAtivs) {%>
                                <tr>
                                    <td ><label><%=ta.getNome()%></label></td>
                                    <td><a href="../ServletCentral?comando=CmdEditarTipoAtividade&ta_id=<%=ta.getId()%>" title="Alterar Tipo Atividade">Alterar</a> |
                                        <a href="../ServletCentral?comando=CmdExcluirTipoAtividade&ta_id=<%=ta.getId()%>" title="Excluir Tipo Atividade" onclick="return confirm('Tem certeza que deseja excluir esse Tipo de Atividade?')">Excluir</a></td>
                                </tr>

                                <%}%>
                            </tbody>
                            <%}%>

                        </table>
                    </div>
                </center>
                <p><a href="../ServletCentral?comando=CmdListarAtividades" title="" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
