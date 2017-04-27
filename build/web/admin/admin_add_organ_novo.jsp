<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : add_organ_novo
    Modified in : 27/04/2017, 14:04:49
    Author     : Fagner Pinheiro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Evento" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%
                Evento en = (Evento) session.getAttribute("evento");
    %>
    <head>
        <script type="text/javascript"  language="javascript" src="../Script.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>        
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title> 
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
                 
        <div id="container">     
          <%-- Incluindo o Menu --%>
          <%@include file="admin_menu.jsp" %>  
           <div id="content">
             <h1 class="text-center titulo"><span class="text-bold">Adicionar organizador ao evento:</span><br/><%=en.getNome()%></h1>
               
              <div class="panel panel-default">
                <div class="panel-heading text-center">Dados do Usúario</div>
                <div class="panel-body"> 
                    
               
            <form action="../ServletCentral" method="post">
                    <%@include file="/error.jsp"%>                    
                    <input type="hidden" name="comando" value="CmdAddOrganizadorNovo"/>
                    
                <div class="row">   
                     <div class="col-lg-offset-1 col-lg-5 space-top">                 
                         <div class="pull-left text-uppercase label label-warning">* Campos obrigatórios</div><br/>
                        <div class="form-group">
                        <input class="form-control" type="text" name="nome" placeholder="* Nome" maxlength="50">
                        </div>
                        
                        <div class="form-group">
                        <input class="form-control" type="text" name="email"  placeholder="* E-mail"  maxlength="50">
                        </div>
                        
                        <div class="form-group">
                        <input class="form-control" type="text" name="fone" onkeypress="return formataContato(this , event)"  placeholder="Telefone" maxlength="12">
                        </div>
                        
                        <div class="form-group">
                        <input class="form-control" type="text" name="data"  placeholder="Data de nascimento" maxlength="10" onkeypress="return formataData(this,event)">
                        </div>
                        
                        <div class="form-group">
                        <select class="form-control" name="sexo" id="sexo">
                            <option value="null" selected>Selecione o sexo</option>
                            <option value="femenino">Feminino</option>
                            <option value="masculino">Masculino</option>
                        </select>
                        </div>                    
                    
                        <div class="form-group">
                        <input class="form-control" type="text"  placeholder="Instituição" maxlength="50" name="instituicao">
                        </div>
                                 
                   
                        <div class="form-group">
                        <input class="form-control" type="text"  placeholder="* Rua" maxlength="50" name="rua">
                        </div>
                        
                        <div class="form-group">
                            <input class="form-control" type="text"  placeholder="* Bairro" maxlength="50" name="bairro">
                        </div>                                                  
                </div>
                <div class="col-lg-5 space-top">  
                       <br/>
                        <div class="form-group">
                        <input class="form-control" type="text"  placeholder="* Número" maxlength="6" name="numero" onkeypress="return validaNumerosSilencioso(event)"/>
                        </div>                     
                    
                        <div class="form-group">
                            <input class="form-control" type="text"  placeholder="* Cidade" maxlength="50" name="cidade">
                        </div>                       
                  
                        <div class="form-group">
                        <input class="form-control" type="text"  placeholder="* UF" maxlength="50" name="uf">
                        </div>  
                     
                        <div class="form-group">
                        <input class="form-control" type="password"  placeholder="* Senha" maxlength="50" name="senha">
                        </div>
                        
                        <div class="form-group">
                        <input class="form-control" type="password"  placeholder="* Digite a senhanovamente" maxlength="50" name="confirmacaoSenha">
                        </div>
                        
                     <div class="panel panel-default">
                         <div class="panel-heading text-center">Permissões</div>
                       <div class="panel-body">  
                         <div class="col-lg-12"> 
                          <input type="checkbox" name="manterAtividade" class="chk_box"/> Manter Atividade<br/>
                          <input type="checkbox" name="manterModulo" class="chk_box"/> Manter Módulo Financeiro<br/>                 
                        </div>
                       </div>    
                      </div>           
                  </div>
                </div>
               </form> 
                    
              </div>
             </div>  
             <a href="" title=""  class="btn btn-default" onclick="history.back(); return false;" class="voltarCadastro">← Voltar</a>
             <input type="submit" value="Enviar" class="btn btn-default pull-right" onclick="return confirmarCadastrado()"/>
           </div>
        </div>    
        <div class="footer-top">         
             <%@include file="../footer.jsp" %>
        </div>  
    </body>
</html>
