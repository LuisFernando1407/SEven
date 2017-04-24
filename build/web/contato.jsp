<%-- 
    Document   : contato
    Created on : 05/03/2011, 14:54:25
    Author     : Gleyson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagens/favicon.png" type="image/x-icon"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
    </head>
    <body>
        <div id="container">
           
            <%@include file="menu_index.jsp"%>
             <img id="img-centro-pet" src="imagens/PET.png"/><img id="img-centro" src="imagens/favicon.png"/>
             <div id="content">
            <div class="text-center-contact">
            <address>
                 <strong>Universidade Federal do Ceará - Campus Quixadá</strong><br>
                 Estrada do Cedro, KM 5, 63900000 - Quixadá - CE<br/>
                <em><a href="mailto: <pet-ufc-si_quixada@googlegroups.com>,"> pet-ufc-si_quixada@googlegroups.com</a></em>
            </address>
            </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
     
    </body>
</html>
