package br.ufc.pet.evento;

import java.util.ArrayList;

public class Administrador extends Perfil {

    private ArrayList<Evento> eventos;

    public ArrayList<Evento> getEventos() {
        return eventos;
    }

    public void setEventos(ArrayList<Evento> eventos) {
        this.eventos = eventos;
    }


    public void removerEventoById(Long id){

            for(int i=0;i<eventos.size();i++){
                if(eventos.get(i).getId().equals(id)){
                eventos.remove(i);
                }
            }

    }
    public void addEvento(Evento en){

    eventos.add(en);
    }
    
}
 
