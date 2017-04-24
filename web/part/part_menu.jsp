<%-- 
    Document   : part_menu
    Created on : 15/07/2010, 14:29:12
    Author     : fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="menu">
    <ul>
        <li><a href="index.jsp" title="Página Inicial">Home</a></li>
        <li><a href="../ServletCentral?comando=CmdListarEventosAbertos" title="Inscrições">Nova Inscrição</a></li>
        <li><a href="part_visualizar_inscricoes.jsp" title="Inscrições">Minhas Inscrições</a></li>
        <li><a href="gerencia_conta.jsp" title="Editar Dados">Gerenciar Conta</a></li>
        <li><a href="../ServletCentral?comando=CmdLogout" title="Logout">Logout</a></li>
    </ul>
</div>