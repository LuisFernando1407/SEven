<%--
    Document   : index
    Created on : 26/03/2010, 16:35:48
    Author     : fernando
--%>
<%-- 
    Document   : add_events
    Modified in : 25/04/2017, 18:02:49
    Author     : Fagner Pinheiro
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
                comando = "Adicionar";
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
      
        <title>SEven</title>
    </head>
    <body>
              
        <div id="container-admin-add-event">
                 
                <%-- Incluindo o Menu --%>
                <%@include file="admin_menu.jsp" %>
          
           
                <h1 class="title-register"> <%=comando%> Evento</h1><hr>
                <%if (men != null) {%>
                <center style="color: red"><label><%=men%></label></center>
                <%}%>
                
              
                <div class="row">
                   <div class = "col-lg-5 col-lg-offset-1">
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
                            <input class="form-control" type="text" id="data_initial"  placeholder="Início do evento" maxlength="10" name="inicio_evento" value="<%=inicioEvento%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <input class="form-control" id="data_finish" type="text" placeholder="Fim do evento" maxlength="10" name="fim_evento" value="<%=fimEvento%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <input class="form-control" id="data_initial_pi" type="text" placeholder="Início do periodo de inscrição" maxlength="10" name="inicio_periodo_inscricao" value="<%=inicioIn%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <input class="form-control" id="data_finish_pi" type="text" placeholder="Fim do periodo de inscrição" maxlength="10" name="fim_periodo_inscricao" value="<%=fimIn%>" onkeypress="return formataData(this,event)"/>
                         </div>
                         <div class="form-group">
                            <input class="form-control" id="max_at" type="text" name="limite_de_atividades_por_participante" placeholder="Maximo de atividades por participante"  value="<%=limiteDeAtividadesPorParticipante%>" onkeypress="return validaNumerosSilencioso(event)"/>
                            <label for="max_at"><span class="label label-warning text-uppercase">Digite 0 (zero) para ilimitado</span></label>
                         </div>
                    </div>
                    <div class="col-lg-6">  
                        <div class="form-group">
                            <label for="text_a">Descrição</label>
                            <textarea id="text_a" class="form-control" cols="1" rows="10" name="descricao"><%=descricao%></textarea>  
                       </div>                          
                       <label>O evento é gratuito?</label><br />
                        <label class="radio-inline">
                            <input type="radio" name="gratuito" value="true" id="inlineRadio1"> Sim
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gratuito" value="false" id="inlineRadio2" checked> Não
                        </label><br><br>                              
                   
                   <div class="text-center">
                     <a href="javascript:history.back();" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                     <button type="submit" class="btn btn-default" onclick="return confirmarCadastrado()">Cadastrar</button>
                   </div>
                 </div>  
                </form>
                </div>                
           </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
