<%-- 
    Document   : orga_add_responsavel
    Created on : 15/07/2010, 16:52:42
    Author     : Escritorio projetos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="br.ufc.pet.evento.Usuario,br.ufc.pet.evento.Atividade" %>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
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
        <% ArrayList<Usuario> us = (ArrayList<Usuario>) session.getAttribute("usuarios");
                    session.removeAttribute("usuarios");
                    //recuperar dados do formulario que ja foram preenchidos para que nao sejam perdidos
                    String nome = request.getParameter("nome_atividade");
                    String local = request.getParameter("local");
                    String vagas = request.getParameter("vagas");
                    //String tipo = request.getParameter("tipo_id");

                    Atividade ativTemp = new Atividade();
                    if (nome != null) {
                        ativTemp.setNome(nome);
                    } else {
                        ativTemp.setNome("");
                    }
                    if (local != null) {
                        ativTemp.setLocal(local);
                    } else {
                        ativTemp.setLocal("");
                    }
                    try {
                        ativTemp.setVagas(Integer.parseInt(vagas));
                    } catch (Exception e) {
                        ativTemp.setVagas(0);
                    }
                    if (nome != null || local != null || vagas != null) {
                        session.setAttribute("atividadeTemp", ativTemp);
                    }
        %>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Adicionar um responsável à Atividade</h1>
                <p style="font-size: medium;">Você pode tornar responsável um usuário já cadastrado ou cadastrar um novo responsável.</p>
                <%@include file="/error.jsp"%>
                <div id="content_right">
                    <p style="margin-top: 5px;"><a style="font-size: medium; color: #0E464E;" href="organ_add_novo_responsavel.jsp" title="Adicionar Responsavel" >Clique aqui para cadastrar um novo responsavel!</a></p>
                </div>
                <div id="content_left">
                    <h2 class="titulo" style="margin-bottom: 10px;">Busca de usuários pelo nome ou parte do nome:</h2>
                <form name="formAddResponsavel" action="../ServletCentral" method="POST">
                    <input type="hidden" name="comando" value="CmdBuscarUsuarioResponsavel">
                    <label>Nome: </label><input type="text" name="nome_busca">
                    <input type="submit" name="btnBuscar" value="Buscar" class="button"><br><br>
                </form>
                <% if (us != null && us.size() > 0) {%>
                <table id="data_table" border="1" align="left">
                    <thead>
                        <tr>
                            <th>NOME</th>
                            <th>Email</th>
                            <th>INCLUIR</th>
                        </tr>
                    </thead>
                    <tbody>
                            <% for (Usuario u : us) {%>
                        <tr>
                            <td><%=u.getNome()%></td>
                            <td><%=u.getEmail()%></td>
                            <td><a href="../ServletCentral?comando=CmdIncluirResponsavel&usuario_id=<%=u.getId()%>" >Incluir</a> </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table><br><br>
                <% }%>
                <p><a href="" title="" onclick="history.back(); return false;" class="voltar">Voltar</a></p>
            </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
