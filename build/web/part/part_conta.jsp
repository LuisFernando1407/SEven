<%-- 
    Document   : part_conta
    Created on : 31/01/2011, 18:36:28
    Author     : ismaily
--%>
<%-- 
    Document   : part_conta
    Modified in : 04/05/2017, 15:59:59
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Participante" %>
<%@page import="br.ufc.pet.util.UtilSeven" %>
<%@page import="java.util.Date" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%    String mensagem = (String) request.getAttribute("mensagem");
    Participante part = (Participante) session.getAttribute("user");
    String fone = part.getUsuario().getFone();
    String instituicao = part.getUsuario().getInstituicao();
    Date dataNascimento = part.getUsuario().getDataNascimento();
    String sexo = part.getUsuario().getSexo();
    String rua = part.getUsuario().getRua();
    String cidade = part.getUsuario().getCidade();
    String bairro = part.getUsuario().getBairro();
    String uf = part.getUsuario().getUf();
    String numero = part.getUsuario().getNumero();
    String confirSenha = part.getUsuario().getSenha();
    String data = null;
    if (fone == null || fone.trim().isEmpty()) {
        fone = "";
    }
    if (cidade == null || cidade.trim().isEmpty()) {
        cidade = "";
    }
    if (instituicao == null || instituicao.trim().isEmpty()) {
        instituicao = "";
    }
    if (sexo == null || sexo.trim().isEmpty()) {
        sexo = "";
    }
    if (rua == null || rua.trim().isEmpty()) {
        rua = "";
    }
    if (bairro == null || bairro.trim().isEmpty()) {
        bairro = "";
    }
    if (uf == null || uf.trim().isEmpty()) {
        uf = "";
    }
    if (numero == null || numero.trim().isEmpty()) {
        numero = "";
    }
    if (dataNascimento == null) {
        data = "";
    } else {
        data = UtilSeven.treatToString(part.getUsuario().getDataNascimento());
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../Script.js"></script>
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
    </head>
    <body>
        <div id="container">

            <%@include file="part_menu.jsp" %>

            <div id="content">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">Editar Dados Cadastrais</div>
                    <div class="panel-body"> 
                        <%if (mensagem != null) {%>
                        <h3><%=mensagem%></h3><br />
                        <% }%>

                        <div class="row">   

                            <form action="../ServletCentral" method="post">
                                <div class="col-lg-offset-1 col-lg-5 space-top"> 
                                    <input type="hidden" name="comando" value="CmdEditarParticipante" />
                                    <%@include file="../error.jsp" %>
                                    <br/><div class="pull-left text-uppercase label label-warning">* Campos obrigatórios</div><br/>

                                    <div class="form-group">                                       
                                        <input type="text" maxlength="50" class="form-control space-top" value="<%=part.getUsuario().getNome()%>"  name="nome" 
                                               <% if (part.getUsuario().isCertificadoGerado()) {%>   
                                               disabled="disabled"
                                               <% }%> 
                                               />
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="Telefone" type="text" maxlength="12" value="<%=fone%>" onkeypress="return formataContato(this, event)" name="fone" class="form-control" />
                                    </div>
                                    <div class="form-group">                                       
                                        <input placeholder="* E-mail" type="text" maxlength="50" value="<%=part.getUsuario().getEmail()%>" name="email" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="Data de Nascimento" type="text" name="dt_nascimento" value="<%=data%>" onkeypress="return formataData(this, event)" maxlength="10" class="form-control"/>
                                    </div>
                                    <div class="form-group">                                      
                                        <select class="form-control" id="sexo" name="sexo">
                                            <option value="Masculino" selected>* Sexo</option>
                                            <option value="Masculino">Masculino</option>
                                            <option value="Feminino">Feminino</option>
                                        </select>
                                    </div>                          
                                    <div class="form-group">
                                        <input placeholder="Instituição" type="text" maxlength="50" value="<%=instituicao%>" name="instituicao" class="form-control"/>
                                    </div>

                                </div>
                                <div class="col-lg-5 space-top">      
                                    <div class="form-group">                                        
                                        <input placeholder="* Rua" type="text" maxlength="50" value="<%=rua%>" name="rua" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="* Bairro" type="text" maxlength="50" value="<%=bairro%>" name="bairro" class="form-control"/>
                                    </div>

                                    <div class="form-group">                                        
                                        <input placeholder="* Número" type="text" maxlength="6" value="<%=numero%>" onkeypress="return validaNumerosSilencioso(event);" name="numero" class="form-control"/>
                                    </div>
                                    <div class="form-group">                                      
                                        <input placeholder="* Cidade" type="text" maxlength="50" value="<%=cidade%>" name="cidade" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="* UF" type="text" maxlength="50" value="<%=uf%>" name="uf" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="* Senha" type="password" maxlength="50" value="<%=confirSenha%>" name="senha" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input placeholder="* Digite a senha novamente" type="password" maxlength="50" value="<%=confirSenha%>" name="r-senha" class="form-control"/>
                                    </div>

                                    <input type="submit" value="Enviar" class="btn btn-default pull-right"/><br/>

                                </div>                                
                            </form>
                        </div>
                        <div class="space-top"></div>
                    </div>
                </div>
            </div>
            <a href="" title="" onclick="history.back(); return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span>Voltar</a><br/>
        </div>
        </div>
        <div class="footer-top">        
            <%@include file="../footer.jsp" %>
        </div>
    </body>
</html>
