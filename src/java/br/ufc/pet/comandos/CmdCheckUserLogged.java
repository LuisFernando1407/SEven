/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.pet.comandos;

import br.ufc.pet.evento.Administrador;
import br.ufc.pet.evento.Organizador;
import br.ufc.pet.evento.Participante;
import br.ufc.pet.evento.Perfil;
import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.EventoService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luis1
 */

public class CmdCheckUserLogged implements Comando{

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);

           Perfil perfil = (Perfil) session.getAttribute("user");

            if (perfil == null) {
                return "/index.jsp";
            } else if (perfil instanceof Participante) {
                session.setAttribute("user", perfil);
                EventoService es = new EventoService();
                session.setAttribute("eventosAbertos", es.buscarEventosComInscricoesAbertas());
                return "/part/index.jsp";
            } else if (perfil instanceof Organizador) {
                session.setAttribute("user", perfil);
                return "/org/index.jsp";
            } else if (perfil instanceof Administrador) {
                session.setAttribute("user", perfil);
                return "/admin/index.jsp";
            }
            
         return "/index.jsp";
    }

}
