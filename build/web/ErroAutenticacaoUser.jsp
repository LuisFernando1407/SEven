<%-- 
    Document   : ErroAutenticacaoUser
    Created on : 15/03/2011, 15:20:52
    Author     : ismaily
--%>
<%@page import="br.ufc.pet.evento.Perfil" %>

<%
            Perfil perfilUser = (Perfil) session.getAttribute("user");
            if (perfilUser == null) {
                session.setAttribute("erro", "Ops! Para acessar a página desejada é necessário autenticação!");
                response.sendRedirect(request.getContextPath()+"/index.jsp");
                return;
                
            }
%>


