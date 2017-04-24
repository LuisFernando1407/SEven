<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.ResponsavelAtividade, br.ufc.pet.evento.Usuario" %>
<%@include file="../ErroAutenticacaoUser.jsp" %>
<%
            ResponsavelAtividade responsavel = (ResponsavelAtividade) session.getAttribute("responsAtual");
            Usuario usuario = responsavel.getUsuario();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Novo Responsavel</title>
        <script type="text/javascript" src="../Script.js"> </script>

    </head>
    <body>
        <div id="container">
            <div id="top">
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Cadastro</h1>
                <%@include file="/error.jsp" %>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <input type="hidden" name="comando" value="CmdEditarResponsavel" />
                    <fieldset>
                        <label>Nome*:</label><br />
                        <input type="text" name="nome" value="<%=usuario.getNome()%>" /><br />
                        <label>E.mail*:</label><br />
                        <input type="text" name="email" value="<%=usuario.getEmail()%>"/><br />
                        <label>Senha*:</label><br />
                        <input type="password" name="senha" value="<%=usuario.getSenha()%>"/><br />
                        <label>Repita a senha*:</label><br />
                        <input type="password" name="r-senha" value="<%=usuario.getSenha()%>"/><br />
                        <label>Telefone:</label><br />
                        <input type="text" name="fone" value="<%=usuario.getFone()%>"/><br />
                        <label>Data de Nascimento:</label><br />
                        <input type="text" name="dt_nascimento" onkeyup="formataData(this,event)" maxlength="10"/><br />
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
                        <label>Sexo:</label><br />
                        <select id="sexo" name="sexo">
                            <option value="Masculino" <%=selectMasc%>>Masculino</option>
                            <option value="Feminino" <%=selectFem%> >Feminino</option>
                        </select> <br/>
                        <label>Instituição:</label><br />
                        <input type="text" name="instituicao"value="<%=usuario.getInstituicao()%>" /><br />
                        <label>Rua:</label><br />
                        <input type="text" name="rua"value="<%=usuario.getRua()%>" /><br />
                        <label>Bairro:</label><br />
                        <input type="text" name="bairro"value="<%=usuario.getBairro()%>" /><br />
                        <label>Número:</label><br />
                        <input type="text" name="numero"value="<%=usuario.getNumero()%>" /><br />
                        <label>Cidade:</label><br />
                        <input type="text" name="cidade" value="<%=usuario.getCidade()%>"/><br />
                        <label>UF:</label><br />
                        <input type="text" name="uf"value="<%=usuario.getUf()%>" /><br />
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" /><br />
                </form>
                <p><a href="" title="" onclick="history.back(); return false;" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
