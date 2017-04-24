<%-- 
    Document   : organ_menu
    Created on : 13/07/2010, 14:37:36
    Author     : fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="menu">
    <ul>
        <li><a href="../ServletCentral?comando=CmdRecarregarEventosOrganizador" title="Página Inicial">Home</a></li>
        <li><a href="organ_selecionar_evento.jsp" title="Gerenciar Atividades">Eventos e Atividades</a></li>
        <li><a href="organ_financeiro.jsp" title="Módulo Financeiro">Financeiro</a></li>
        <li><a href="organ_inscricoes.jsp" title="Gerenciar Inscrições">Inscrições</a></li>
        <li><a href="organ_relatorios.jsp" title="Relatórios">Relatórios</a></li>
        <li><a href="../ServletCentral?comando=CmdLogout" title="Logout">Logout</a></li>
    </ul>
</div>
