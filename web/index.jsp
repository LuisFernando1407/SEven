<%-- 
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%
    br.ufc.pet.services.EventoService es = new br.ufc.pet.services.EventoService();
    java.util.ArrayList<br.ufc.pet.evento.Evento> eventos = es.buscarEventosAbertos();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="imagens/favicon.png" type="image/x-icon"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="jquery/jquery-ui-1.10.4.custom.min.js"></script>
       
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%@include file="menu_index.jsp"%>
            <div id="content">
                <div id="content_left">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">Eventos Abertos para Inscrições</div>
                        <div class="panel-body">
                 
                    <%if (eventos == null || eventos.size() == 0) {%>
                        <br/><div style="height: 242px;" class="alert text-center" role="alert">Nenhum Evento disponível no momento.</div>
                       
                    <%} else {%>
                    <div class="table-responsive">
                        <div style="height: 278px; overflow: auto;">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Evento</th>
                                        <th>Sigla</th>
                                        <th>Programação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (br.ufc.pet.evento.Evento e : eventos) {%>
                                    <tr>
                                        <td> <%= e.getNome()%>  </td>
                                        <td> <%= e.getSigla()%> </td>
                                        <td> <a href="ServletCentral?comando=CmdVisualizarProgramacao&id=<%= e.getId()%>" title="Programacao" > Visualizar</a> </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% }%>
                
                     </div>
                    </div>
                </div>
                <div id="content_right">
                    <h1 class="titulo">Login</h1>
                      <hr/>
                    <center>
                        <form action="ServletCentral" method="post">
                            <input type="hidden" name="comando" value="CmdLogin" />
                                <legend class="nodisplay">Formulário de Login</legend>
                                  <div class="form-group">
                                    <input type="text" class="form-control" id="email" placeholder="Email" name="email"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="senha" placeholder="Senha" name="senha"/>
                                </div>
                                <div class="form-group">
                                <select name="conta"  class="form-control" id="conta">
                                    <option value="null">Tipo de conta</option>
                                    <option value="participante">Participante</option>
                                    <option value="organizador">Organizador</option>
                                    <option value="administrador">Administrador</option>
                                </select>
                                </div>
                                <%@include file="error.jsp" %>
                                <p><button type="submit" class="btn btn-default">Submeter</button>
                                     <blockquote><a href="recuperar_senha.jsp">Esqueci minha senha</a><br/>
                                            <a href="cadastro.jsp">Cadastre-se aqui</a>
                                    </blockquote>
                                </p>
                        </form>
                    </center>   
                </div>
            </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
