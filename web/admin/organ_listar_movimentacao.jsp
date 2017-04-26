<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando/fagner
--%>
<%-- 
    Document   : part_menu
    Modified in : 24/04/2017, 16:42:49
    Author     : Fagner Pinheiro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@page import="br.ufc.pet.services.EventoService"%>
<%@page import="br.ufc.pet.evento.Organizador"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        Evento event = (Evento) session.getAttribute("evento");
        ArrayList<Organizador> orgs = event.getOrganizadores();
    %>
    <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
       
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="container">   
            <%-- Incluindo o Menu --%>
            <%@include file="admin_menu.jsp" %>
            <div id="content">
                <h1 class="titulo"><strong>Evento:</strong> <%=event.getNome()%></h1>        
                
                  <div class="panel panel-default">
                     <div class="panel-heading text-center">Organizadores do Evento</div>
                     <div class="panel-body">      
                        
                      <form action="" >
                        <input type="hidden" name="idUsuario"/>
 -                      <input type="hidden" name="idEvento"/>
                         
                            <table class="table table-hover text-center" id="data_table">
                                <%@include file="/error.jsp"%>
                                <%if (orgs == null || orgs.size() == 0) {%>
                                <label><center>Evento sem organizadores no momento!</center></label><br/>
                                        <%} else {%>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Alterar</th> 
                                        <th>Excluir</th>
                                    </tr>
                                    
                                </thead>
                                <tbody>
                                    <%for (Organizador org : orgs) {%>
                                    <tr>
                                        <td><%=org.getUsuario().getNome()%></td>
                                        <td>
                                            <a href="../ServletCentral?comando=CmdExibirOrganizadorEditar&idUsuario=<%=org.getUsuario().getId()%>" 
                                               title="Alterar Eventos"><span class="label label-success ">Alterar<span></a>
                                        </td>
                                        <td>
                                            <a href="../ServletCentral?comando=CmdExcluirOrganizador&idUsuario=<%=org.getUsuario().getId()%>" 
                                               title="Excluir Eventos" onclick="return confirmarExclucao()"><span class="label label-danger">Excluir</span></a>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <%}%>
                            </table> 
                      </form>   
                    </div>          
                </div>
                            
                   <a class="btn btn-default" href="" 
                      title="" onclick="history.back(); return false;" class="voltar">← Voltar</a>
                        
                   <a  class="btn btn-default" href="admin_buscar_organ.jsp" 
                      title="Adicionar Organizador">Adicionar Organizador</a>    
                
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
