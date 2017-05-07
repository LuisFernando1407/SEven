<%-- 
    Document   : organ_add_horario
    Created on : 01/08/2010, 16:52:59
    Author     : Escritorio projetos
--%>
<%-- 
    Document   : organ_add_horario
    Modified in : 07/05/2017, 15:15:57
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@page 
    import="java.util.ArrayList,br.ufc.pet.evento.Horario,br.ufc.pet.evento.Evento,java.text.DateFormat, java.text.SimpleDateFormat" 
 %>
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script language="javascript" src="../jquery/jquery-1.10.2.js"></script>
        <script language="javascript" src="../jquery/jquery-ui-1.10.4.custom.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../Script.js"></script>
    </head>
    <body>
        <%
                    Horario horario = (Horario) session.getAttribute("horario");
                    String titulo = "Adicionar";
                    String hi = "";
                    String mi = "";
                    String hf = "";
                    String mf = "";
                    String data = "";
                    if (horario != null) {
                        hi = String.format("%02d", horario.getHoraInicial()) ;
                        mi = String.format("%02d", horario.getMinutoInicial());
                        hf = String.format("%02d", horario.getHoraFinal());
                        mf = String.format("%02d", horario.getMinutoFinal());
                        data = br.ufc.pet.util.UtilSeven.treatToString(horario.getDia());
                        titulo = "Editar";
                    }
                    Evento evento = (Evento) session.getAttribute("evento");
                    String dataInicio = "--/--/----";
                    String dataFim = "--/--/----";
                    if(evento != null){
                        DateFormat format = new SimpleDateFormat("dd/MM/YYYY");
                        dataInicio = format.format(evento.getInicioPeriodoEvento());
                        dataFim = format.format(evento.getFimPeriodoEvento());
                    }
        %>
        <div id="container">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
                
                <div id="content">
                <%@include file="/error.jsp" %>
                <h1 class="titulo"><%=titulo%> Horario</h1>
                <form action="../ServletCentral?comando=CmdAdicionarHorario" method="post" class="text-center">
                    <div class="form-group form-inline">
                        <label>Hora inicial:</label><br/>
                        <input maxlength="2" type="text" onkeypress="return validaNumerosSilencioso(event)" name="hora_inicial" value="<%=hi%>" class="form-control"/>:
                        <input maxlength="2"type="text" onkeypress="return validaNumerosSilencioso(event)"name="min_inicial" value="<%=mi%>" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>Hora Final:</label><br/>
                        <input maxlength="2" type="text"  onkeypress="return validaNumerosSilencioso(event)"name="hora_final" value="<%=hf%>" class="form-control"/> :
                        <input maxlength="2" type="text"  onkeypress="return validaNumerosSilencioso(event)"name="min_final" value="<%=mf%>" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>Data:</label><br/>
                        <input type="text" onkeypress="return formataData(this,event)" maxlength="10" name="dia" value="<%=data%>" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Data do Evento - De: <strong><%=dataInicio%></strong></label> 
                        <label> até: <strong><%=dataFim%></strong> </label> 
                    </div>
                    <a href="../ServletCentral?comando=CmdListarHorarios" title="" class="btn btn-default"><span aria-hidden="true">&larr;</span> Voltar</a>
                    <input type="submit" value="Enviar" class="btn btn-default" onclick="return confirm('Deseja realmente enviar esses dados?')" />
                </form>
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
