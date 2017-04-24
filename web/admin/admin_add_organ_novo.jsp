<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
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
        <title>Centro de Controle :: Administrador</title>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo">Adicionar organizador ao evento <%=en.getNome()%></h1>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <%@include file="/error.jsp"%>
                    <input type="hidden" name="comando" value="CmdAddOrganizadorNovo"/>
                    <fieldset>
                        <label style="float: right;">* Campos obrigatórios</label><br/>
                        <h2 class="titulo">Dados do usuário</h2>
                        <label>Nome (*):</label><br />
                        <input type="text" name="nome" maxlength="50"/><br />
                        <label>E-mail (*):</label><br />
                        <input type="text" name="email" maxlength="50"/><br />
                        <label>Telefone:</label><br />
                        <input type="text" name="fone" onkeypress="return formataContato(this , event)" maxlength="12"/><br />
                        <label>Data do nascimento:</label><br />
                        <input type="text" name="data" maxlength="10" onkeypress="return formataData(this,event)"/><br />
                        <label>Sexo (*):</label><br />
                        <select name="sexo" id="sexo">
                            <option value="femenino">Feminino</option>
                            <option value="masculino">Masculino</option>
                        </select><br />
                        <label>Instituição:</label><br />
                        <input type="text"  maxlength="50" name="instituicao" /><br />
                        <label>Rua (*):</label><br />
                        <input type="text" maxlength="50" name="rua" /><br />
                        <label>Bairro (*):</label><br />
                        <input type="text" maxlength="50" name="bairro" /><br />
                        <label>Número (*):</label><br />
                        <input type="text" maxlength="6" name="numero" onkeypress="return validaNumerosSilencioso(event)"/><br />
                        <label>Cidade (*):</label><br />
                        <input type="text" maxlength="50" name="cidade" /><br />
                        <label>UF (*):</label><br />
                        <input type="text" maxlength="50" name="uf"/><br />
                        <label>Senha (*):</label><br />
                        <input type="password" maxlength="50" name="senha"/> <br />
                        <label>Digite a senha novamente (*):</label><br />
                        <input type="password" maxlength="50" name="confirmacaoSenha" /><br />
                        <h2 class="titulo">Permissões</h2>
                        <input type="checkbox" name="manterAtividade" class="chk_box" /><label>Manter Atividade</label><br />
                        <input type="checkbox"  name="manterModulo" class="chk_box" /><label>Manter Módulo Financeiro</label><br />
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" onclick="return confirmarCadastrado()"  />
                    <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
