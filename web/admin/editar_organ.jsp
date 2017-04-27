<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : edi_organ
    Modified in : 27/04/2017, 21:04:49
    Author     : Fagner Pinheiro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@page import="br.ufc.pet.evento.Usuario" %>
<%@page import="br.ufc.pet.evento.Organizacao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%Evento event = (Evento) session.getAttribute("evento");
                Usuario u = (Usuario) session.getAttribute("uEditar");
                Organizacao org = (Organizacao) session.getAttribute("organizacao");
                session.removeAttribute("organizacao");
                String manterAtvi = "";
                String manterMod = "";
                if (org != null) {
                    boolean matAt = org.getManterAtividade();
                    boolean matMod = org.getManterModuloFinanceiro();
                    if (matAt) {
                        manterAtvi = "checked";
                    }
                    if (matMod) {
                        manterMod = "checked";
                    }
                }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        
    </head>
    <body>
        <div id="container">
           
                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
        
            <div id="content">  
              <h1 class="text-center"><span class="text-bold">Editar organizador do evento:</span><br/> <%=event.getNome()%></h1>
               
                          
                
                <form action="../ServletCentral" method="post" class="cadastro">
                    <input type="hidden" name="comando" value="CmdEditarOrganizador"/>
                    
                 <div class="space-top panel panel-default">
                  <div class="panel-heading text-center">Permissão do Usúario</div>
                   <div class="panel-body">  
                       <div class="col-lg-12 space-top">                   
                        <label>Nome:</label>  <%=u.getNome()%><br />
                        <label>Email:</label> <%=u.getEmail()%><br />
                        <label>Telefone:</label> <%=u.getFone()%><br />
                        <label>Instituição:</label> <%=u.getInstituicao()%><br/>
                        <label>Cidade:</label> <%=u.getCidade()%></label><br />
                      <input type="checkbox"  <%=manterAtvi%> name="manterAtv" class="chk_box" /> Manter Atividade<br/>
                      <input type="checkbox"  <%=manterMod%> name="manterMod" class="chk_box" /> Mater Módulo Financeiro<br/><br/>
                      </div> 
                   </div>
                  </div>                 
                   <input type="submit" value="Enviar" class="btn btn-default center-block" />                   
                </form> 
                   
                <a href="" title="" onclick="history.back(); return false;" class="btn btn-default pull-left">← Voltar</a>
          </div>
                
        </div>
              <div class="footer-top"><%@include file="../footer.jsp" %></div>                
    </body>
</html>
