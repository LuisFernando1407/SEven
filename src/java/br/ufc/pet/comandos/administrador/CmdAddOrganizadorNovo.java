package br.ufc.pet.comandos.administrador;

import br.ufc.pet.evento.Evento;
import br.ufc.pet.evento.Organizacao;
import br.ufc.pet.evento.Organizador;
import br.ufc.pet.evento.Usuario;
import br.ufc.pet.interfaces.Comando;
import br.ufc.pet.services.OrganizacaoService;
import br.ufc.pet.services.OrganizadorService;
import br.ufc.pet.services.UsuarioService;
import br.ufc.pet.util.UtilSeven;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * @author ismaily
 */
public class CmdAddOrganizadorNovo implements Comando {

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession(true);
        Evento en = (Evento) session.getAttribute("evento");
        String nome = (String) request.getParameter("nome");
        String rua = (String) request.getParameter("rua");
        String bairro = (String) request.getParameter("bairro");
        String sexo = (String) request.getParameter("sexo");
        String email = (String) request.getParameter("email");
        String telefone = (String) request.getParameter("fone");
        String data = (String) request.getParameter("data");
        String instituicao = (String) request.getParameter("instituicao");
        String uf = (String) request.getParameter("uf");
        String senha = (String) request.getParameter("senha");
        String ConfSenha = (String) request.getParameter("confirmacaoSenha");
        String cidade = (String) request.getParameter("cidade");
        String numero = (String) request.getParameter("numero");
        String manterAti = (String) request.getParameter("manterAtividade");
        String manterMod = (String) request.getParameter("manterModulo");
        Date date = UtilSeven.treatToDate(data);
        boolean manterAtividade = false;
        boolean manterModulo = false;

        if (manterAti != null) {
            manterAtividade = true;
        }
        if (manterMod != null) {
            manterModulo = true;
        }

        if (nome == null || rua == null || bairro == null || email == null || telefone == null || sexo == null
                || data == null || instituicao == null || uf == null || senha == null || ConfSenha == null || cidade == null || numero == null
                || nome.trim().isEmpty() || rua.trim().isEmpty() || bairro.trim().isEmpty() || sexo.trim().isEmpty()
                || email.trim().isEmpty() || telefone.trim().isEmpty() || data.trim().isEmpty() || instituicao.trim().isEmpty()
                || uf.trim().isEmpty() || senha.trim().isEmpty() || ConfSenha.trim().isEmpty() || cidade.trim().isEmpty() || numero.trim().isEmpty()) {

            session.setAttribute("erro", "Preencha todos os campos!");
            return "/admin/admin_add_organ_novo.jsp";
        } else if (UtilSeven.validaData(data) != true) {
            session.setAttribute("erro", "Data inválida, digite no formato dd/mm/aaaa!");
            return "/admin/admin_add_organ_novo.jsp";
        } else if (!senha.equals(ConfSenha)) {
            session.setAttribute("erro", "senhas não conferem!");
            return "/admin/admin_add_organ_novo.jsp";
        } else {

            UsuarioService us = new UsuarioService();
            Usuario u = us.getByEmail(email);
            if (u != null) {
                session.setAttribute("erro", "E-mail já cadastrado!");
                return "/admin/admin_add_organ_novo.jsp";
            }
            u = criarUsuario(bairro, instituicao, nome, email, rua, sexo, numero, uf, cidade, senha, telefone, date);
            if (us.inserir(u)) {
                Organizador o = criarOrganizador(new Date(), true, u);
                OrganizadorService orgS = new OrganizadorService();
                if (orgS.adicionar(o)) {
                    Organizacao orga = criarOrganizacao(o, en, manterAtividade, manterModulo);
                    OrganizacaoService orgaS = new OrganizacaoService();
                    if (orgaS.adicionar(orga)) {
                        en.addOrganizador(o);
                        o.setOrganizacoes(orga);
                        session.setAttribute("sucesso", "cadastrado com sucesso!");
                        return "/admin/organ_listar_movimentacao.jsp";
                    }
                }
            }
            session.setAttribute("erro", " falha ao cadastrar!");
            return "/admin/organ_listar_movimentacao.jsp";



        }

    }

    private Organizacao criarOrganizacao(Organizador organizador, Evento evento, boolean manterAtividade, boolean manterModuloFinanceiro) {
        Organizacao orga = new Organizacao();
        orga.setEvento(evento);
        orga.setManterAtividade(manterAtividade);
        orga.setOrganizador(organizador);
        orga.setManterModuloFinanceiro(manterModuloFinanceiro);
        return orga;
    }

    private Organizador criarOrganizador(Date d, boolean status, Usuario u) {
        Organizador o = new Organizador();
        o.setDataCriacao(d);
        o.setUsuario(u);
        o.setStatus(status);
        return o;
    }

    private Usuario criarUsuario(String bairro, String instituicao, String nome, String email, String rua, String sexo, String numero, String uf, String cidade, String senha, String fone, Date date) {
        Usuario u = new Usuario();
        u.setBairro(bairro);
        u.setCidade(cidade);
        u.setDataNascimento(date);
        u.setFone(fone);
        u.setRua(rua);
        u.setUf(uf);
        u.setNome(nome);
        u.setInstituicao(instituicao);
        u.setEmail(email);
        u.setSenha(senha);
        u.setNumero(numero);
        u.setSexo(sexo);
        return u;
    }
}
