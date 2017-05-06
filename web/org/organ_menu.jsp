<%-- 
    Document   : organ_menu
    Created on : 13/07/2010, 14:37:36
    Author     : fernando
--%>
<%-- 
    Document   : organ_menu
    Modified in : 06/05/2017, 18:48:57
    Author     : João Mateus
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
            <li><a href="../ServletCentral?comando=CmdRecarregarEventosOrganizador" title="Página Inicial">Home</a></li>
        <li><a href="organ_selecionar_evento.jsp" title="Gerenciar Atividades">Eventos e Atividades</a></li>
        <li><a href="organ_financeiro.jsp" title="Módulo Financeiro">Financeiro</a></li>
        <li><a href="organ_inscricoes.jsp" title="Gerenciar Inscrições">Inscrições</a></li>
        <li><a href="organ_relatorios.jsp" title="Relatórios">Relatórios</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../ServletCentral?comando=CmdLogout" title="Logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Sair</a></li>
        </ul>
    </div>
</nav>
