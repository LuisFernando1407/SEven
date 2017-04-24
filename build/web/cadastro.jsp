<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensagem = (String)request.getAttribute("mensagem");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="shortcut icon" href="imagens/favicon.png" type="image/x-icon"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="Script.js"> </script>
        <script language="javascript" src="jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="jquery/initDataTable.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <title>SEven</title>
    </head>
    <body>
        <div id="container-register">
            <%@include file="menu_index.jsp"%>
                
                <h1 class="title-register">Cadastro</h1><hr/>
                <%if (mensagem != null) {%>
                <h3><%=mensagem%></h3><br />
                <% } %>
               
                <form action="ServletCentral" method="post">
                    <input type="hidden" name="comando" value="CmdCadastrarParticipante" />
                         <div class="form-group">
                            <input type="text" maxlength="50" class="form-control" id="email" placeholder="Nome completo" name="nome" required/>
                         </div>
                         <div class="form-group">
                            <input type="email" maxlength="50" class="form-control" id="email" placeholder="Email" name="email" required/>
                         </div>
                         <div class="form-group">
                            <input type="text" maxlength="50" class="form-control" id="email" placeholder="Instituição" name="instituicao" required/>
                         </div>
                         <div class="form-group">
                            <input type="password" maxlength="50" class="form-control" id="email" placeholder="Senha" name="senha" required/>
                         </div>
                         <div class="form-group">
                            <input type="password" maxlength="50" class="form-control" id="email" placeholder=" Repita a senha" name="r-senha" required/>
                         </div>
                        <%@include file="error.jsp" %>
                        <div class="col-md-14 text-center"> 
                        <button style="width: 200px;" type="submit" class="btn btn-default">Submeter</button>
                        </div>
                </form></br>
                <a href="javascript:history.back();" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
          </div>
         <%@include file="footer.jsp" %>
    </body>
</html>
