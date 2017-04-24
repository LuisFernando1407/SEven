package br.ufc.pet.comandos.organizador;

import br.ufc.pet.evento.ResponsavelAtividade;
import br.ufc.pet.evento.Usuario;
import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.UsuarioService;
import br.ufc.pet.util.UtilSeven;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * @author Escritorio projetos
 */
public class CmdEditarResponsavel implements Comando {

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        ResponsavelAtividade responsavel = (ResponsavelAtividade) session.getAttribute("responsAtual");
        //Recuperar dados do formulário.
        String nome = request.getParameter("nome");
        String fone = request.getParameter("fone");
        String dataNascimentoS = request.getParameter("dt_nascimento");
        String email = request.getParameter("email");
        String sexo = request.getParameter("sexo");
        String instituicao = request.getParameter("instituicao");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        String numero = request.getParameter("numero");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String senha = request.getParameter("senha");
        String confSenha = request.getParameter("r-senha");

        if (nome == null || nome.trim().equals("") || email == null || email.trim().equals("") || senha == null || senha.trim().equals("") || confSenha == null || confSenha.trim().equals("")) {
            session.setAttribute("erro", "Preencha todos os campos obrigatórios.");
            return "/org/organ_editar_responsavel.jsp";
        }
        if (!senha.trim().equals(confSenha)) {
            session.setAttribute("erro", "A senha não confere com a sua confirmação.");
            return "/org/organ_editar_responsavel.jsp";
        }       
        Date dataNascimento = UtilSeven.treatToDate(dataNascimentoS);
        Usuario usUpdate = responsavel.getUsuario();
        usUpdate.setBairro(bairro);
        usUpdate.setCidade(cidade);
        usUpdate.setEmail(email);
        usUpdate.setFone(fone);
        usUpdate.setInstituicao(instituicao);
        usUpdate.setNome(nome);
        usUpdate.setNumero(numero);
        usUpdate.setRua(rua);
        usUpdate.setSenha(senha);
        usUpdate.setSexo(sexo);
        usUpdate.setUf(uf);
        usUpdate.setDataNascimento(dataNascimento);

        //Validar a inserção
        UsuarioService usService = new UsuarioService();
        Usuario usTemp = usService.getByEmail(email);
        if (usTemp != null) {
            if (!usTemp.getId().equals(usUpdate.getId())) {
                session.setAttribute("erro", "E-Mail já cadastrado.");
                return "/org/organ_editar_responsavel.jsp";
            }
            if (usService.update(usUpdate)) {
                session.setAttribute("sucesso", "Responsável editado com sucesso.");
            } else {
                session.setAttribute("erro", "Erro ao tentar editar Responsável por Atividade.");
                return "/org/organ_editar_responsavel.jsp";
            }
        }
        return "/org/organ_add_atividades.jsp";
    }
}
    
