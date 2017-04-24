package br.ufc.pet.comandos.administrador;

import br.ufc.pet.evento.Administrador;
import br.ufc.pet.evento.Evento;
import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.EventoService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * @author ismaily
 */
public class CmdEncerrarEvento implements Comando{

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        EventoService es= new EventoService();
        Long id= Long.parseLong(request.getParameter("id"));
        System.out.println(id);
        Evento e = es.getEventoById(id);
        System.out.println(e.getNome());
        if(es.encerrar(id)){
        session.setAttribute("sucesso", "Evento encerrado com sucesso!");
        Administrador admin = (Administrador) session.getAttribute("user");
        admin.setEventos(es.buscarEventosAbertos());
        }else{
        session.setAttribute("erro", "Erro ao encerrar evento!");
        }
        return "/admin/manege_events.jsp";
    }
}
