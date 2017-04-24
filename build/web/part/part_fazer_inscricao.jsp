<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : Caio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="br.ufc.pet.util.UtilSeven"%>
<%@page import="br.ufc.pet.evento.Atividade"%>
<%@page import="br.ufc.pet.evento.Evento"%>
<%@page import="br.ufc.pet.evento.Horario"%>
<%@page import="br.ufc.pet.evento.Inscricao"%>
<%@page import="br.ufc.pet.evento.ModalidadeInscricao"%>
<%@page import="br.ufc.pet.evento.TipoAtividade"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <%          Inscricao anterior; //recupera a inscricao do caso de uso Editar Inscricao
                if (session.getAttribute("inscricao") != null) {
                    anterior = (Inscricao) session.getAttribute("inscricao");
                } else {//para o caso de não ser uma edição, um objeto em branco será usado.
                    anterior = new Inscricao();
                }
                //pega evento selecionado da sessão
                Evento e = (Evento) session.getAttribute("eventoSelecionado");
                //gera array com as atividades ofertadas pelo evento
                ArrayList<Atividade> oferta = e.getAtividadeQueAceitamInscricao();
               // for (int i = 0; i < oferta.size(); i++) {
                 //   if (!oferta.get(i).isAceitaInscricao()) {
                   //     oferta.remove(i);
                    //}
               // }
                //gera array que conterá as atividades que o participante vai selecionar
                ArrayList<Atividade> arrayDeSelecionadas = new ArrayList();
                //atividades que ele selecionou anteriormente, caso ele tenha feito isso
                if (session.getAttribute("inscricao") != null) {
                    arrayDeSelecionadas.addAll(anterior.getAtividades());
                } //se ele nao selecionou nenhuma anteriormente, o array vai ficar vazio.
                //pega da sessão as modalidades de inscricao
                ArrayList<ModalidadeInscricao> modalidades;
                if (session.getAttribute("modalidades") != null) {
                    modalidades = (ArrayList<ModalidadeInscricao>) session.getAttribute("modalidades");
                } else {
                    modalidades = new ArrayList();
                }
                //pega array de tipos de atividades da sessão para gerar a tabela de preços
                ArrayList<TipoAtividade> arrayDeTipos = (ArrayList<TipoAtividade>) session.getAttribute("arrayDeTipos");
                //pega da sessão alguma mensagem de erro, caso algum problema retorne para esta pagina
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Centro de Controle :: Administrador</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script type="text/javascript" src="../jquery/jquery.dataTables.js"></script>
        <script type="text/javascript" src="../jquery/initDataTable.js"></script>
    </head>
    <body>
        <div id="container">
            <div id="top">
                <%-- Incluindo Menu --%>
                <%@include file="part_menu.jsp" %>
            </div>
            <div id="content">
                <%if (modalidades.isEmpty()) {
                                session.setAttribute("erro", "Atenção: erro interno - não foram recuperadas as modalidades de inscricao com sucesso.");
                            }
                            if (arrayDeTipos.isEmpty()) {
                                session.setAttribute("erro", "Atenção: erro interno - não foram recuperados os tipos de atividade com sucesso.");
                            }
                %>
                <%@include file="/error.jsp"%>
                <h1 class="titulo">Inscrição no evento <%=e.getNome()%></h1>
                <fieldset>
                    <h2 class="titulo" style="margin-bottom: 10px;">Tabela de preços:</h2>
                    <table class="data_table" width="600px;" border="0">
                        <thead>
                            <tr>
                                <th>Tipos de atividades</th>
                                <%for (ModalidadeInscricao m : modalidades) {%>
                                <th><%=m.getTipo()%></th>
                                <%}%>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (TipoAtividade t : arrayDeTipos) {%>
                            <tr>
                                <td><%=t.getNome()%></td>
                                <%for (ModalidadeInscricao m : modalidades) {
                                        String p;
                                        p = UtilSeven.precoFormater(UtilSeven.getPrecoTipo(t, m));
                                %>
                                <td><%=p%></td>
                                <%}%>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <br/>
                </fieldset>
                <br/>
                <form action="../ServletCentral?comando=CmdMontarInscricao" method="post" class="">
                    <fieldset>
                        <h2 class="titulo" style="margin-bottom: 10px;">Personalização da Inscrição:</h2>
                        <hr style="border-top: none; border-bottom: dotted; color: dimgray;"/>
                        <p style="margin-left: 40px;" >Atividades atualmente selecionadas (não conflitantes):</p>
                        <%if (arrayDeSelecionadas.isEmpty()) {%><%--Utiliza o array de selecionadas--%>
                        <p style="margin-left: 40px;" >Nenhuma atividade selecionada</p>
                        <%} else {%>
                        <table class="data_table" width="600px;" border="0">
                            <thead>
                                <tr>
                                    <th>Nome da Atividade</th>
                                    <th>Remover</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Atividade a : arrayDeSelecionadas) {%><%--Exibindo as atividades selecionadas--%>
                                <tr>
                                    <td><%=a.getNome()%></td>
                                    <td><a href="../ServletCentral?comando=CmdRemoverAtividade&ativ=<%=a.getId()%>" title="RemoverAtividade">Remover</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%}%>
                        <hr style="border-top: none; border-bottom: dotted; color: dimgray;"/>

                        <%if (oferta == null || oferta.isEmpty()) {%>
                        <p style="margin-left: 40px;" >Este evento não contém atividades selecionáveis.</p>
                        <%} else {%>
                        <p style="margin-left: 40px;" >Oferta de atividades opcionais:</p>
                        <table class="data_table" width="600px;" border="0">
                            <thead>
                                <tr>
                                    <th>Nome da Atividade</th>
                                    <th>Horários</th>
                                    <th>Tipo</th>
                                    <th>Selecionar</th>
                                    <th>Vagas</th>
                                    <th>Vagas Disponíveis</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Atividade a : oferta) {%> <%--Exibindo elementos do array de oferta--%>
                                <tr>
                                    <td><%=a.getNome()%></td>
                                    <td>
                                        <%for (Horario h : a.getHorarios()) {%>
                                        (<%=h.printHorario()%>)
                                        <%}%>
                                    </td>
                                    <td><%=a.getTipo().getNome() %></td>
                                    <td><a href="../ServletCentral?comando=CmdSelecionarAtividade&ativ=<%=a.getId()%>" title="SelecionarAtividade">Selecionar</a></td>
                                    <%int vagas = a.getVagas();
                                        br.ufc.pet.services.InscricaoService IS = new br.ufc.pet.services.InscricaoService();
                                        long vagasOcupadas = IS.getInscritosByAtividadeId(a.getId());
                                    %>
                                    <td><%=vagas%>
                                    </td>
                                    <td><%=vagas - vagasOcupadas%>
                                    </td>
                                    <%--O link redireciona ao comando, que por sua vez pega o id da atividade em questão e insere a mesma no array das atividades selecionadas--%>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%}%>
                        <hr style="border-top: none; border-bottom: dotted; color: dimgray;"/>

                        <%if (modalidades.isEmpty()) {%>
                        <p style="margin-left: 40px;" >Nenhuma modalidade de inscrição cadastrada.</p>
                        <%} else {%>
                        <p style="margin-left: 40px;" >Tipo de inscrição:</p><%--Modalidade da inscrição, Estudante ou profissional--%>
                        <%for (ModalidadeInscricao m : modalidades) {%>
                        <p style="margin-left: 60px;" ><input class="radio" type="radio" name="tipo_inscricao" value="<%=m.getId()%>" <%if (m.getId().equals(anterior.getModalidade().getId())) {%> checked="checked" <%}%>/> <%=m.getTipo()%></p>
                            <%}%>
                            <%}%>
                    </fieldset>
                    <br/>
                    <fieldset>
                        <h2 class="titulo" style="margin-bottom: 10px;">Preços para a seleção atual:</h2>
                        <%
                                    String preco;
                                    for (ModalidadeInscricao m : modalidades) {
                                        preco = UtilSeven.precoFormater(UtilSeven.getPrecoAtividades(arrayDeSelecionadas, m.getId()));
                        %>
                        <p style="margin-left: 60px;"> <%=m.getTipo()%> -> <%=preco%></p>
                        <%}%>
                    </fieldset>
                    <center><input type="submit" value="Inscrever-se" class="" /></center><br />
                </form>
                <p><a href="" title="" onclick="history.back(); return false;" class="voltar">Voltar</a></p>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
