<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
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
                <h1 class="titulo">Edição de organizador do evento <%=event.getNome()%></h1>
                <form action="../ServletCentral" method="post" class="cadastro">
                    <input type="hidden" name="comando" value="CmdEditarOrganizador"/>
                    <fieldset>
                        <h2 class="titulo">Permissões do organizador:</h2>
                        <label>Nome:  <%=u.getNome()%></label><br />
                        <label>Email: <%=u.getEmail()%>  </label><br />
                        <label>Telefone: <%=u.getFone()%></label><br />
                        <label>Instituição: <%=u.getInstituicao()%></label><br/>
                        <label>Cidade: <%=u.getCidade()%></label><br />
                        <input type="checkbox"  <%=manterAtvi%> name="manterAtv" class="chk_box" /><label>Manter Atividade</label><br />
                        <input type="checkbox"  <%=manterMod%> name="manterMod" class="chk_box" /><label>Mater Módulo Financeiro</label><br />
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" />
                    <a href="" title="" onclick="history.back(); return false;" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
