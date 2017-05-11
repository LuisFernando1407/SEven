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
   @Created on : 11/05/2017, 00:41:14
 * @author luisfernando
 */

public class CmdCheckUserLogged implements Comando{

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);

           Perfil perfil = (Perfil) session.getAttribute("user");

            if (perfil == null) {
                return "/index.jsp";
            } else if (perfil instanceof Participante) {
                return "/part/index.jsp";
            } else if (perfil instanceof Organizador) {
                return "/org/index.jsp";
            } else if (perfil instanceof Administrador) {
                return "/admin/index.jsp";
            }
           
         return "/index.jsp";
    }

}
