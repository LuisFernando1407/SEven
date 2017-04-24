<%-- 
    Document   : organ_add_horario
    Created on : 01/08/2010, 16:52:59
    Author     : Escritorio projetos
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
        <title>Centro de Controle :: Administrador</title>
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
            <div id="top">
                <%-- Incluindo o Menu --%>
                <%@include file="organ_menu.jsp" %>
            </div>
            <div id="content">
                <h1 class="titulo"><%=titulo%> Horario</h1>
                <%@include file="/error.jsp" %>
                <form action="../ServletCentral?comando=CmdAdicionarHorario" method="post" class="cadastro">
                    <fieldset>
                        <label>Hora inicial:</label><br/>
                        <input style="width: 70px;" maxlength="2" type="text" onkeypress="return validaNumerosSilencioso(event)" name="hora_inicial" value="<%=hi%>"/>:
                        <input style="width: 70px;" maxlength="2"type="text" onkeypress="return validaNumerosSilencioso(event)"name="min_inicial" value="<%=mi%>"/><br/><br/>
                        <label>Hora Final:</label><br/>
                        <input style="width: 70px;" maxlength="2" type="text"  onkeypress="return validaNumerosSilencioso(event)"name="hora_final" value="<%=hf%>"/>:
                        <input style="width: 70px;" maxlength="2" type="text"  onkeypress="return validaNumerosSilencioso(event)"name="min_final" value="<%=mf%>"/><br /><br/>
                        <label>Data:</label><br />
                        <input style="width: 152px;"type="text" onkeypress="return formataData(this,event)" maxlength="10" name="dia" value="<%=data%>"/><br><br>
                                
                        <label>Data do Evento - De: <strong><%=dataInicio%></strong>  </label> 
                        <label> até: <strong><%=dataFim%></strong> </label> 
                    </fieldset>
                    <input type="submit" value="Enviar" class="button" onclick="return confirm('Deseja realmente enviar esses dados?')" />
                    <a href="../ServletCentral?comando=CmdListarHorarios" title="" class="voltarCadastro">Voltar</a>
                </form>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
