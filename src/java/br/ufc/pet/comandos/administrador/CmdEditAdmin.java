package br.ufc.pet.comandos.administrador;

import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.AdministradorService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * @author mardson
 */
public class CmdEditAdmin implements Comando{

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        String temp = request.getParameter("id");
        
        if( temp != null){
         String senha = request.getParameter("senha");
         String rsenha = request.getParameter("rsenha");
           if(senha.equals(rsenha)){
                long id = Long.parseLong(temp);
                AdministradorService adm = new AdministradorService();
                adm.alterarSenhaAdmin(id, senha);
            }
        }
            return "/admin/index.jsp";
    }

}
