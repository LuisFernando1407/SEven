<%-- 
    Document   : organ_add_tipo_ativ
    Created on : 03/09/2010, 15:56:35
    Author     : Escritorio projetos
--%>
<%-- 
    Document   : organ_add_tipo_ativ
    Modified in : 07/05/2017, 16:28:57
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@page import="java.util.ArrayList,br.ufc.pet.evento.TipoAtividade,br.ufc.pet.evento.ModalidadeInscricao"%>
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
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
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
                
            <div id="content">
                <%@include file="/error.jsp" %>
                <h1 class="titulo"><%=titulo%> Tipo de Atividade</h1>
                <form action="../ServletCentral?comando=CmdAdicionarTipoAtividade" method="post">
                    <div class="form-group">
                        <label>Nome:</label><br/>
                        <input type="text" name="tipo_nome" value="<%=ativNome%>" class="form-control"/>
                    </div>
                    <a href="../ServletCentral?comando=CmdListarTipoAtividade" title="" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                    <input type="submit" value="Enviar" class="btn btn-default" onclick="return confirm('Deseja realmente enviar esses dados?')"/>
                </form>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>

