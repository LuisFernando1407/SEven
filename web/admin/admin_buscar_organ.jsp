<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Usuario" %>
<%@page import="br.ufc.pet.evento.Perfil" %>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%        ArrayList<Usuario> users = (ArrayList<Usuario>) session.getAttribute("nomes");
        session.removeAttribute("nomes");
        Evento event = (Evento) session.getAttribute("evento");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
    </head>
    <body>
        <div id="container">
<!--            <div id="top">-->
                <%-- Incluindo o Menu --%>
                 <%@include file="admin_menu.jsp" %>
   
         
            <div id="content">
                <h1 class="titulo">Adicionar organizador ao evento <%=event.getNome()%></h1>
                <p style="font-size: medium;">Você pode tornar organizador um usuário já cadastrado ou cadastrar um novo organizador.</p>
                <div id="content_right">
                  
                </div>
                <div id="content_left">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">Busca de usuários pelo nome ou parte do nome</div>
                        <div class="panel-body ">
                             <form action="../ServletCentral" method="post" class=" col-lg-12 space-top">
                              <input type="hidden" name="comando" value="CmdBuscarUsuario"/>
                                 <div class="form-group">
                                     <input type="text" name="nome" class="form-control" placeholder="Nome" selected />
                                 </div> 
                                   <div class="form-group">
                                     <input type="submit" value="Buscar" class="btn btn-default"  /> 
                                     <a  href="admin_add_organ_novo.jsp" title="Criar Organizador ainda não cadastrado" class="btn btn-default pull-right">Criar Organizador ainda não cadastrado</a>
                                   </div>
                            </form>     
                                
                         </div>  
                    </div>
                </div>
                    <form action="" >
                        <input type="hidden" name="comando"/>
                        <input type="hidden" name="idUsuario"/>
                        <%@include file="/error.jsp"%>
                    </form>
                   
                        <table id="data_table" class="table table-hover text-center">

                            <%if (users != null && users.size() > 0) {%>
                            <thead>
                                <tr>
                                    <th class="panel-cor"> Nome do usuário</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Usuario user : users) {%>
                                <tr>
                                    <td><a href="../ServletCentral?comando=CmdExibirOrganizadorEditar&idUsuario=<%=user.getId()%>" title=""><%=user.getNome()%></a></td>
                                </tr>

                                <%}%>
                            </tbody>
                            <%}%>

                        </table>
                     
                            <p><a href="" title=""  class="btn btn-default" onclick="history.back(); return false;" class="voltarCadastro">← Voltar</a></p>
               
            </div>
            <div class="footer-top">              
              <%@include file="../footer.jsp" %>
            </div>
    </div>         
    </body>
</html>
