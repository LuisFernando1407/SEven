<%-- 
    Document   : organ_add_tipo_ativ
    Created on : 03/09/2010, 15:56:35
    Author     : Escritorio projetos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@page import="java.util.ArrayList,br.ufc.pet.evento.TipoAtividade,br.ufc.pet.evento.ModalidadeInscricao"%>
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
        <script type="text/javascript" src="../Script.js"> </script>
    </head>
    <body>
        <%
                    br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
                    ArrayList<ModalidadeInscricao> modalidades = br.ufc.pet.util.UtilSeven.getModalidadeByEvento(e.getId());
                    TipoAtividade tipoAtividade = (TipoAtividade) session.getAttribute("tipoAtividade");
                    String ativNome = "";
                    String titulo = "Adicionar";
                    if (tipoAtividade != null) {
                        ativNome = tipoAtividade.getNome();
                        titulo = "Editar";
                    }

        %>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo"><%=titulo%> Tipo de Atividade</h1>
                <%@include file="/error.jsp" %>
                <form action="../ServletCentral?comando=CmdAdicionarTipoAtividade" method="post" class="cadastro">
                    <fieldset>
                        <label >NOME:</label><br/>
                        <input type="text" name="tipo_nome" value="<%=ativNome%>"/><br/>
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" onclick="return confirm('Deseja realmente enviar esses dados?')" />
                    <a href="../ServletCentral?comando=CmdListarTipoAtividade" title="" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>

