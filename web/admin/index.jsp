<%-- 
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Administrador"%>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
            Administrador admin = (Administrador) session.getAttribute("user");
            String nomeSaudacao = admin.getUsuario().getNome().split(" ")[0];
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
       
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript"  language="javascript" src="../Script.js"></script>
      
    </head>
    <body>
        <div id="container-admin-home">
                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
                    <h1 class="titulo">Olá, <%= nomeSaudacao%></h1>
                    <p>Esta é a página inicial do Administrador. Quando desejar retornar a esta página, clique na opção <span class="text-uppercase label label-info"><em>Home</em></span> no menu acima.</p>
                    </br>
                <%@include file="/error.jsp" %>
               <div class="table-responsive">
                <div style="height:330px; overflow: auto;">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Sigla</th>
                            <th>Nome</th>
                            <th>Período de Inscrição</th>                       
                            <th>Gerenciar Dados Cadastrais</th>
                            <th>Excluir</th>
                            <th>Encerrar Evento</th>
                            <th>Programação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Evento E : admin.getEventos()) {%>
                        <tr>
                            <td><%=E.getSigla()%></td>
                            <td><%=E.getNome()%></td>
                            <td><%=br.ufc.pet.util.UtilSeven.treatToString(E.getInicioPeriodoInscricao()) + "</br>" + br.ufc.pet.util.UtilSeven.treatToString(E.getFimPeriodoInscricao())%></td>
                            <td><a href="../ServletCentral?comando=CmdBuscarEvento&id=<%=E.getId()%>"><span class="text-uppercase label label-success">Alterar</span></a></td>
                            <td><a href="../ServletCentral?comando=CmdExcluirEvento&id=<%=E.getId()%>" onclick="return confirmarExclucao()"><span class="text-uppercase label label-danger">Excluir</span></a></td>
                            <td><a href="../ServletCentral?comando=CmdEncerrarEvento&id=<%=E.getId()%>" onclick="return confirm('Deseja realmente encerrar Evento?')"><span class=" text-uppercase label label-warning">Encerrar</span></a></td>
                            <td><a href="../ServletCentral?comando=CmdVisualizarProgramacao&id=<%=E.getId()%>" title="Programacao" ><span class="text-uppercase label label-info">Visualizar</span></a> </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                </div>
               </div></br>
               <div align="right"><a class="btn btn-default" href="add_events.jsp" role="button">Criar novo evento</a></div>
        </div>
       <%@include file="../footer.jsp" %>
    </body>
</html>
