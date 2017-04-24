<%-- 
    Document   : admin_menu
    Created on : 14/07/2010, 16:08:24
    Author     : fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">
                <img style="width: 78px; margin-top: -10px;" alt="Logo"  src="../imagens/Seven.png"/>
            </a>
        </div>
        
        <ul class="nav navbar-nav">
            <li><a href="index.jsp" title="Página Inicial">Home</a></li>
            <!-- <li><a href="ServletCentral?comando=CmdVisualizarTodasProgramacoes">Programação</a></li>-->
            <li><a href="manege_orgs.jsp" title="Gerenciar Organizadores">Gerenciar Organizadores</a></li>
            <li><a href="edit_senha_admin.jsp" title="Alterar Senha">Alterar Senha</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../ServletCentral?comando=CmdLogout" title="Logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Sair</a></li>
        </ul>
    </div>
</nav>