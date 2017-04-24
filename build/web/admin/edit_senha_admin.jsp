<%-- 
    Document   : gerencia_conta
    Created on : 02/07/2013, 10:26:01
    Author     : mardson
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Participante" %>
<%@page import="br.ufc.pet.util.UtilSeven" %>
<%@page import="br.ufc.pet.evento.Administrador" %>
<%@page import="java.util.Date" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%
          
            Administrador admin = (Administrador) session.getAttribute("user");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
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
        <script type="text/javascript" src="Script.js"> </script>
    </head>
    <body>
        <div id="container-register">
            <%@include file="admin_menu.jsp" %>
        
            
                <h1 class="title-register">Alterar Senha</h1><hr>
                <form action="../ServletCentral" method="post">
                    <div class="form-group">
                        <input type="password" maxlength="50" class="form-control" placeholder="Digita a senha" name="senha" required/>
                    </div>
                    <div class="form-group">
                        <input type="password" maxlength="50" class="form-control" placeholder="Repita a senha" name="rsenha" required/>
                    </div>
                    <input type="hidden" value="CmdEditAdmin" name="comando">
                    <input type="hidden" value="<%=admin.getUsuario().getId()%>" name="id">
                       
                    <div align="center"><button type="submit" class="btn btn-default" onclick="return confirmarCadastrado()">Atualizar</button></div>
                </form>
        </div>
        <%@include file="../footer.jsp"%>
    </body>
</html>
