<%--
    Document   : index
    Created on : 02/07/2013, 09:35:48
    Author     : mardson
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufc.pet.evento.Evento" %>
<%@page import=" br.ufc.pet.util.UtilSeven" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@include file="../ErroAutenticacaoUser.jsp" %>

<%

            Evento evento = (Evento) session.getAttribute("evento");
            session.removeAttribute("evento");
            String men = (String) session.getAttribute("men");
            session.removeAttribute("men");
            String comando = "Adicionar";

            String sigla = (String)session.getAttribute("siglaEvento");
            session.removeAttribute("siglaEvento");
            if(sigla==null)
                sigla="";

            String nome = (String)session.getAttribute("nomeEvento");
            session.removeAttribute("nomeEvento");
            if(nome==null)
                nome="";

            String tema = (String)session.getAttribute("tema");
            session.removeAttribute("tema");
            if(tema == null)
                tema="";
 
            String inicioIn = (String)session.getAttribute("inicioInscricao");
            session.removeAttribute("inicioInscricao");
            if(inicioIn == null)
                inicioIn="";

            String fimIn = (String)session.getAttribute("fimInscricao");
            session.removeAttribute("fimInscricao");
            if(fimIn == null)
                fimIn="";

            String descricao = (String)session.getAttribute("descricao");
            session.removeAttribute("descricao");
            if(descricao == null)
                descricao="";

            String limiteDeAtividadesPorParticipante = (String)session.getAttribute("limiteDeAtividadesPorParticipante");
            session.removeAttribute("limiteDeAtividadesPorParticipante");
            if(limiteDeAtividadesPorParticipante == null)
                limiteDeAtividadesPorParticipante="";

            String inicioEvento = (String)session.getAttribute("inicioEvento");
            session.removeAttribute("inicioEvento");
            if(inicioEvento == null)
                inicioEvento="";
            
            String fimEvento = (String)session.getAttribute("fimEvento");
            session.removeAttribute("inicioEvento");
            if(fimEvento == null)
                fimEvento="";

            if (evento != null) {
                comando = "Alterar";
                sigla = evento.getSigla();
                nome = evento.getNome();
                tema = evento.getTema();
                inicioIn = UtilSeven.treatToString(evento.getInicioPeriodoInscricao());
                fimIn = UtilSeven.treatToString(evento.getFimPeriodoInscricao());
                limiteDeAtividadesPorParticipante = evento.getLimiteAtividadePorParticipante()+"";
                descricao = evento.getDescricao();
                inicioEvento = UtilSeven.treatToString(evento.getInicioPeriodoEvento());
                fimEvento = UtilSeven.treatToString(evento.getFimPeriodoEvento());
            }
%>
<html>
    <head>
        <script type="text/javascript"  language="javascript" src="../Script.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
       
        <script src="../bootstrap/js/bootstrap.min.js"></script>
      
    </head>
    <body>

        <div id="container-admin-add-event">

                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
          
           
                <h1 class="title-register"> <%=comando%> Evento</h1><hr>
                <%@include file="/error.jsp" %>
                <%if (men != null) {%>
                <center style="color: red"><label><%=men%></label></center>
                <%}%>
                    <form action="../ServletCentral?comando=CmdAdicionarEvento&operacao_evento=<%=evento == null ? 0 : evento.getId()%>" method="post">
       
                         <div class="form-group">
                            <input class="form-control" type="text" name="nome_evento" placeholder="Nome" value="<%=nome%>" />
                         </div>
                          <div class="form-group">
                            <input class="form-control" type="text" name="sigla_evento" placeholder="Sigla" value="<%=sigla%>" />
                         </div>
                         <div class="form-group">
                            <input class="form-control" type="text" name="tema_evento" placeholder="Tema" value="<%=tema%>" />
                         </div>
                         <div class="form-group">
                            <label for="data_initial">Início do evento</label>
                            <input class="form-control" type="text" id="data_initial" name="inicio_evento" maxlength="10" value="<%=inicioEvento%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <label for="data_finish">Fim do evento</label>
                            <input class="form-control" id="data_finish" type="text" name="fim_evento" maxlength="10" value="<%=fimEvento%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <label for="data_initial_pi">Inicio do Periodo de Inscrição</label>
                            <input class="form-control" id="data_initial_pi" type="text" name="inicio_periodo_inscricao" maxlength="10" value="<%=inicioIn%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <label for="data_finish_pi">Fim do Periodo de Inscrição</label>
                            <input class="form-control" id="data_finish_pi" type="text" name="fim_periodo_inscricao" maxlength="10" value="<%=fimIn%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <input class="form-control" id="max_at" type="text" name="limite_de_atividades_por_participante" placeholder="Maximo de atividades por participante"  value="<%=limiteDeAtividadesPorParticipante%>" onkeypress="return validaNumerosSilencioso(event)"/>
                            <label for="max_at"><span class="label label-warning">Digite 0 (zero) para ilimitado</span></label>
                         </div>
                
                        <label>O evento é gratuito?</label><br />
                        <label class="radio-inline">
                            <input type="radio" name="gratuito" value="true" id="inlineRadio1"> Sim
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gratuito" value="false" id="inlineRadio2" checked> Não
                        </label><br><br>
                        <div class="form-group">
                            <label for="text_a">Descrição</label>
                            <textarea id="text_a" class="form-control" cols="1" rows="10" name="descricao"><%=descricao%></textarea>  
                       </div>
                       <div align="center"><button type="submit" class="btn btn-default" onclick="return confirmarCadastrado()">Alterar</button></div>
                    </form>
            <a href="javascript:history.back();" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
        </div>
        <%@include file="../footer.jsp"%>
    </body>
</html>
