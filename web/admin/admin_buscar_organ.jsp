<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Usuario" %>
<%@page import="br.ufc.pet.evento.Perfil" %>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        ArrayList<Usuario> users = (ArrayList<Usuario>) session.getAttribute("nomes");
        session.removeAttribute("nomes");
        Evento event = (Evento) session.getAttribute("evento");
    %>
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
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Adicionar organizador ao evento <%=event.getNome()%></h1>
                <p style="font-size: medium;">Você pode tornar organizador um usuário já cadastrado ou cadastrar um novo organizador.</p>
                <div id="content_right">
                    <p style="margin-top: 5px;"><a style="font-size: medium; color: #0E464E;" href="admin_add_organ_novo.jsp" title="Criar Organizador ainda não cadastrado" class="adicionar">Criar Organizador ainda não cadastrado</a></p>
                </div>
                <div id="content_left">
                    <h2 class="titulo" style="width: 435px;">Busca de usuários pelo nome ou parte do nome:</h2>
                    <form action="../ServletCentral" method="post" class="box_destaque cadastro">
                        <input type="hidden" name="comando" value="CmdBuscarUsuario"/>
                        <fieldset>
                            <label>Nome:</label><br />
                            <input type="text" name="nome" class="buscar" /><br/>
                            <input type="submit" value="Buscar" class="button" style="margin-left: 20px;" />
                        </fieldset>
                    </form>
                    <form action="" >
                        <input type="hidden" name="comando"/>
                        <input type="hidden" name="idUsuario"/>
                        <%@include file="/error.jsp"%>
                        <table id="data_table">

                            <%if (users != null && users.size() > 0) {%>
                            <thead>
                                <tr>
                                    <th>Nome do usuário</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Usuario user : users) {%>
                                <tr>
                                    <td><a href="../ServletCentral?comando=CmdExibirOrganizadorEditar&idUsuario=<%=user.getId()%>" title=""><%=user.getNome()%></a></td>
                                </tr>

                                <%}%>
                            </tbody>
                            <%}%>

                        </table>
                    </form>
                    <p><a href="" title="" onclick="history.back();
                            return false;" class="voltar">Voltar</a></p>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
