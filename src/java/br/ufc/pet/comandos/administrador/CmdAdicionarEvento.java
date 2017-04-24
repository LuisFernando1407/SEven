package br.ufc.pet.comandos.administrador;

import br.ufc.pet.evento.Administrador;
import br.ufc.pet.evento.Evento;

import br.ufc.pet.evento.Organizador;
import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.EventoService;
import br.ufc.pet.util.SendMail;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import br.ufc.pet.util.UtilSeven;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.MessagingException;

/*
 * @author welligton
 */
public class CmdAdicionarEvento implements Comando {

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        Administrador admin = (Administrador) session.getAttribute("user");

        String nomeEvento = request.getParameter("nome_evento");
        session.setAttribute("nomeEvento", nomeEvento);
        String siglaEvento = request.getParameter("sigla_evento");
        session.setAttribute("siglaEvento", siglaEvento);
        String descricao = request.getParameter("descricao");
        session.setAttribute("descricao", descricao);
        String tema = request.getParameter("tema_evento");
        session.setAttribute("tema", tema);
        String inicioEvento = request.getParameter("inicio_evento");
        session.setAttribute("inicioEvento", inicioEvento);
        String fimEvento = request.getParameter("fim_evento");
        session.setAttribute("fimEvento", fimEvento);
        String inicioInscricao = request.getParameter("inicio_periodo_inscricao");
        session.setAttribute("inicioInscricao", inicioInscricao);
        String fimInscricao = request.getParameter("fim_periodo_inscricao");
        session.setAttribute("fimInscricao", fimInscricao);
        String limiteDeAtividadesPorParticipante = request.getParameter("limite_de_atividades_por_participante");
        session.setAttribute("limiteDeAtividadesPorParticipante", limiteDeAtividadesPorParticipante);
        String gratuito = request.getParameter("gratuito");
        session.setAttribute("gratuito", gratuito);

        
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        Date data = UtilSeven.treatToDate(dateFormat.format(date));

        int limiteDeAtividades;
        
        Evento E = null;
        if (!request.getParameter("operacao_evento").equalsIgnoreCase("0")) {
            E = new EventoService().getEventoById(Long.parseLong(request.getParameter("operacao_evento")));
        }
        if (nomeEvento == null || nomeEvento.trim().equals("") || 
           siglaEvento == null|| siglaEvento.trim().equals("") || 
           descricao == null || descricao.trim().equals("") || 
           tema==null || tema.trim().equals("") || 
           inicioInscricao == null || inicioInscricao.trim().equals("") || 
           fimInscricao == null || fimInscricao.trim().equals("") || 
           limiteDeAtividadesPorParticipante == null || limiteDeAtividadesPorParticipante.trim().equals("")) {
            
            session.setAttribute("erro", "Preencha todos os campos");
            session.setAttribute("evento", E);
            return "/admin/add_events.jsp";
        } else if (UtilSeven.validaData(inicioInscricao) != true || UtilSeven.validaData(fimInscricao) != true
                || !UtilSeven.validaData(inicioEvento) || !UtilSeven.validaData(fimEvento)) {
            session.setAttribute("erro", "Data Inválida, digite no formato dd/mm/aaaa");
            return "/admin/add_events.jsp";
        } else {
            
            try{
                limiteDeAtividades = Integer.parseInt(limiteDeAtividadesPorParticipante);
            }
            catch(NumberFormatException e){
                System.out.print(limiteDeAtividadesPorParticipante);
                session.setAttribute("erro", "Limite de atividades inválido. Por favor digite apenas números.");
                return "/admin/add_events.jsp";
            }
            
            if (UtilSeven.treatToDate(inicioEvento).before(data)) {
                session.setAttribute("erro", "Data de início do evento anterior a data de hoje.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(inicioEvento).after(UtilSeven.treatToDate(fimEvento))) {
                session.setAttribute("erro", "Data de início do evento posterior ao término do evento.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(inicioInscricao).before(data)) {
                session.setAttribute("erro", "Data de início das incrições anterior a data de hoje.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(inicioInscricao).after(UtilSeven.treatToDate(fimEvento))) {
                session.setAttribute("erro", "Data de início das inscrições posterior ao término do evento.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(inicioInscricao).after(UtilSeven.treatToDate(inicioEvento))) {
                session.setAttribute("erro", "Data de início das inscrições posterior ao início do evento.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(inicioInscricao).after(UtilSeven.treatToDate(fimInscricao))) {
                session.setAttribute("erro", "Data de início das inscrições posterior ao término das inscrições.");
                return "/admin/add_events.jsp";
            }
            if (UtilSeven.treatToDate(fimInscricao).after(UtilSeven.treatToDate(inicioEvento))) {
                session.setAttribute("erro", "Data de fim das inscrições posterior ao início do evento.");
                return "/admin/add_events.jsp";
            }
            if (request.getParameter("operacao_evento").equalsIgnoreCase("0")){
                EventoService es = new EventoService();
                Evento aux1 = es.getEventoBySigla(siglaEvento);
                Evento aux2 = es.getEventoByNome(nomeEvento);
                
                if ( (aux1 != null && aux1.isAtivo()) || (aux2 != null && aux2.isAtivo())) {
                    session.setAttribute("erro", "Evento já cadastrado");
                    return "/admin/add_events.jsp";
                }
                
                E = new Evento();
                
                /*
                Verificando o valor que veio do formulário e atribuindo ao atributo do
                objeto evento (E)
                */
                
                if(request.getParameter("gratuito").equals("true")){
                    E.setGratuito(true);
                }else{ 
                    E.setGratuito(false);
                }
                
                E.setNome(nomeEvento);
                E.setSigla(siglaEvento);
                E.setTema(tema);
                E.setInicioPeriodoEvento(UtilSeven.treatToDate(inicioEvento));
                E.setFimPeriodoEvento(UtilSeven.treatToDate(fimEvento));
                E.setInicioPeriodoInscricao(UtilSeven.treatToDate(inicioInscricao));
                E.setFimPeriodoInscricao(UtilSeven.treatToDate(fimInscricao));
                E.setAdministrador(admin);
                E.setDescricao(descricao);
                E.setLimiteAtividadePorParticipante(limiteDeAtividades);
                if (es.adicionar(E)) {
                    admin.addEvento(E);
                    session.setAttribute("sucesso", "Evento adicionado com sucesso");
                    return "/admin/manege_events.jsp";
                } else {
                    session.setAttribute("erro", "Erro ao adicionar evento");
                }
             } else {
                admin.removerEventoById(E.getId());
                E.setNome(nomeEvento);
                E.setSigla(siglaEvento);
                E.setTema(tema);
                E.setInicioPeriodoEvento(UtilSeven.treatToDate(inicioEvento));
                E.setFimPeriodoEvento(UtilSeven.treatToDate(fimEvento));
                E.setInicioPeriodoInscricao(UtilSeven.treatToDate(inicioInscricao));
                E.setFimPeriodoInscricao(UtilSeven.treatToDate(fimInscricao));
                E.setLimiteAtividadePorParticipante(limiteDeAtividades);
                E.setAdministrador(admin);
                E.setDescricao(descricao);
                EventoService es = new EventoService();
                es.atualizar(E);
                admin.addEvento(E);
                
                for(Organizador org : E.getOrganizadores()){
                    try {
                        String msg = "O administrador alterou os dados do evento, por favor verifique os horários das atividades!";
                        SendMail.sendMail(org.getUsuario().getEmail(), "(SEVEN) Alteração no evento "+E.getNome(), msg);
                    } catch (MessagingException ex) {
                    System.out.println("Erro ao enviar o email para os organizadores: "+ex);
                }
        }
                session.setAttribute("sucesso", "Evento alterado com sucesso");

            }
        }
        return "/admin/manege_events.jsp";
    }
}
