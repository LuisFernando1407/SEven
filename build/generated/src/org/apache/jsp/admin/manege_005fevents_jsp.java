package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.ufc.pet.evento.Administrador;
import br.ufc.pet.evento.Evento;
import br.ufc.pet.evento.Perfil;

public final class manege_005fevents_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/admin/../ErroAutenticacaoUser.jsp");
    _jspx_dependants.add("/admin/admin_menu.jsp");
    _jspx_dependants.add("/error.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

            Perfil perfilUser = (Perfil) session.getAttribute("user");
            if (perfilUser == null) {
                session.setAttribute("erro", "Ops! Para acessar a página desejada é necessário autenticação!");
                response.sendRedirect(request.getContextPath()+"/index.jsp");
                return;
                
            }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");
        Administrador admin = (Administrador) session.getAttribute("user");
    
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <script type=\"text/javascript\"  language=\"javascript\" src=\"../Script.js\"></script>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\r\n");
      out.write("        <link href=\"../css/estilo.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("        <title>Centro de Controle :: Administrador</title>\r\n");
      out.write("        <script language=\"javascript\" src=\"../jquery/jquery-1.10.2.js\"></script>\r\n");
      out.write("        <script language=\"javascript\" src=\"../jquery/jquery-ui-1.10.4.custom.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../jquery/jquery.dataTables.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../jquery/initDataTable.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"container\">\r\n");
      out.write("            <div id=\"top\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-default navbar-fixed-top\">\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("        <div class=\"navbar-header\">\r\n");
      out.write("            <a class=\"navbar-brand\">\r\n");
      out.write("                <img style=\"width: 78px; margin-top: -10px;\" alt=\"Logo\"  src=\"../imagens/Seven.png\"/>\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <ul class=\"nav navbar-nav\">\r\n");
      out.write("            <li><a href=\"index.jsp\" title=\"Página Inicial\">Home</a></li>\r\n");
      out.write("            <!-- <li><a href=\"ServletCentral?comando=CmdVisualizarTodasProgramacoes\">Programação</a></li>-->\r\n");
      out.write("            <li><a href=\"manege_orgs.jsp\" title=\"Gerenciar Organizadores\">Gerenciar Organizadores</a></li>\r\n");
      out.write("            <li><a href=\"edit_senha_admin.jsp\" title=\"Alterar Senha\">Alterar Senha</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("            <li><a href=\"../ServletCentral?comando=CmdLogout\" title=\"Logout\"><span class=\"glyphicon glyphicon-log-out\" aria-hidden=\"true\"></span> Sair</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"content\">\r\n");
      out.write("                <h1 class=\"titulo\">Gerenciar Eventos</h1>\r\n");
      out.write("                <a style=\"font-size: medium;\" href=\"add_events.jsp\" title=\"Adicionar Eventos\">Criar novo evento</a>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"error_msg\">\r\n");
      out.write("    ");

                String sucesso = (String) session.getAttribute("sucesso");
                String erro = (String) session.getAttribute("erro");
                session.removeAttribute("sucesso");
                session.removeAttribute("erro");

                if (erro != null) {
      out.write("\r\n");
      out.write("    <div class=\"alert alert-danger alert-dismissable fade in\">\r\n");
      out.write("        <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n");
      out.write("         <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>\r\n");
      out.write("         <span class=\"sr-only\">Error:</span> \r\n");
      out.write("        ");
      out.print(erro);
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
}
                if (sucesso != null) {
      out.write("\r\n");
      out.write("    <div class=\"alert alert-success alert-dismissable\">\r\n");
      out.write("        <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n");
      out.write("        <span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>\r\n");
      out.write("        <span class=\"sr-only\">Success:</span> \r\n");
      out.write("        ");
      out.print(sucesso);
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
}
      out.write("\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("                <div class=\"table-responsive\">\r\n");
      out.write("                <table class=\"table table-hover\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>Sigla</th>\r\n");
      out.write("                            <th>Nome</th>\r\n");
      out.write("                            <th>Período de Inscrição</th>                       \r\n");
      out.write("                            <th>Gerenciar Dados Cadastrais</th>\r\n");
      out.write("                            <th>Excluir</th>\r\n");
      out.write("                            <th>Encerrar</th>\r\n");
      out.write("                            <th>Programação</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        ");
for (Evento E : admin.getEventos()) {
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>");
      out.print(E.getSigla());
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print(E.getNome());
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print(br.ufc.pet.util.UtilSeven.treatToString(E.getInicioPeriodoInscricao()) + " à " + br.ufc.pet.util.UtilSeven.treatToString(E.getFimPeriodoInscricao()));
      out.write("</td>\r\n");
      out.write("                            <td><a href=\"../ServletCentral?comando=CmdBuscarEvento&id=");
      out.print(E.getId());
      out.write("\">Visualizar / Alterar</a></td>\r\n");
      out.write("                            <td><a href=\"../ServletCentral?comando=CmdExcluirEvento&id=");
      out.print(E.getId());
      out.write("\" onclick=\"return confirmarExclucao()\">Excluir</a></td>\r\n");
      out.write("                            <td><a href=\"../ServletCentral?comando=CmdEncerrarEvento&id=");
      out.print(E.getId());
      out.write("\" onclick=\"return confirm('Deseja realmente encerrar Evento?')\">Encerrar</a></td>\r\n");
      out.write("                            <td> <a href=\"../ServletCentral?comando=CmdVisualizarProgramacao&id=");
      out.print(E.getId());
      out.write("\" title=\"Programacao\" > Visualizar</a> </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        ");
 }
      out.write("\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"footer\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
