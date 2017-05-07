<%-- 
    Document   : organ_editar_responsavel
    Modified in : 07/05/2017, 03:36:57
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.ResponsavelAtividade, br.ufc.pet.evento.Usuario" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%    ResponsavelAtividade responsavel = (ResponsavelAtividade) session.getAttribute("responsAtual");
    Usuario usuario = responsavel.getUsuario();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
            <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
            <title>SEven</title>
            <script type="text/javascript" src="../Script.js"></script>

    </head>
    <body>
        <div id="container">
            <%@include file="organ_menu.jsp" %>

            <div id="content">
                <%@include file="/error.jsp" %>
                <h1 class="titulo">Cadastro</h1>
                <form action="../ServletCentral" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">Dados Cadastrais</div>
                        <form action="../ServletCentral" method="post">
                            <div class="panel-body">  
                                <div class="col-lg-12 space-top">
                                    <input type="hidden" name="comando" value="CmdEditarResponsavel" />
                                    <div class="form-group">
                                        <label>Nome*:</label>
                                        <input type="text" name="nome" value="<%=usuario.getNome()%>" class="form-control" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>E.mail*:</label>
                                        <input type="text" name="email" value="<%=usuario.getEmail()%>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Senha*:</label>
                                        <input type="password" name="senha" value="<%=usuario.getSenha()%>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Repita a senha*:</label>
                                        <input type="password" name="r-senha" value="<%=usuario.getSenha()%>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Telefone:</label>
                                        <input type="text" name="fone" value="<%=usuario.getFone()%>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Data de Nascimento:</label>
                                        <input type="text" name="dt_nascimento" onkeyup="formataData(this, event)" maxlength="10" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <%String sexo = usuario.getSexo();
                                            String selectMasc = "";
                                            String selectFem = "";
                                            if (sexo != null) {
                                                if (sexo.equals("Masculino")) {
                                                    selectMasc = "selected=\"selected\"";
                                                } else if (sexo.equals("Feminino")) {
                                                    selectFem = "selected=\"selected\"";
                                                }
                                            }
                                        %>
                                        <label>Sexo:</label>
                                        <select id="sexo" name="sexo" class="form-control">
                                            <option value="Masculino" <%=selectMasc%>>Masculino</option>
                                            <option value="Feminino" <%=selectFem%> >Feminino</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Instituição:</label>
                                        <input type="text" name="instituicao" value="<%=usuario.getInstituicao()%>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Rua:</label>
                                        <input type="text" name="rua"value="<%=usuario.getRua()%>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Bairro:</label>
                                        <input type="text" name="bairro"value="<%=usuario.getBairro()%>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Número:</label>
                                        <input type="text" name="numero"value="<%=usuario.getNumero()%>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Cidade:</label>
                                        <input type="text" name="cidade" value="<%=usuario.getCidade()%>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>UF:</label>
                                        <input type="text" name="uf"value="<%=usuario.getUf()%>"  class="form-control"/>
                                    </div>                                
                                </div>
                            </div>
                    </div>
                    <div class="form-group">
                        <a href="" title="" onclick="history.back(); return false;" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                        <input type="submit" value="Enviar" class="btn btn-default" />
                    </div>
                </form>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
