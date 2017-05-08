<%--
    Document   : index
    Created on : 23/07/2014, 16:35:48
    Author     : Junior
--%>
<%-- 
    Document   : organ_gerenciar_upload_certificados
    Modified in : 07/05/2017, 16:40:57
    Author     : João Mateus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="br.ufc.pet.evento.Atividade,br.ufc.pet.evento.Organizador,br.ufc.pet.evento.Organizacao,br.ufc.pet.evento.ResponsavelAtividade" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <%@include file="../ErroAutenticacaoUser.jsp" %>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../imagens/favicon.png" type="image/x-icon"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SEven</title>
        <script type="text/javascript">
            function checkFile() {
                var fileElement = document.getElementById("uploadFile");
                var fileExtension = "";
                if (fileElement.value.lastIndexOf(".") > 0) {
                    fileExtension = fileElement.value.substring(fileElement.value
                            .lastIndexOf(".") + 1, fileElement.value.length);
                }
                if (fileExtension == "jpg") {
                    return true;
                } else {
                    alert("Você deve selecionar um arquivo no formarto 'jpg' para upload.");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%            br.ufc.pet.evento.Evento e = (br.ufc.pet.evento.Evento) session.getAttribute("evento");
            Organizador organizador = (Organizador) session.getAttribute("user");
            ArrayList<Atividade> ats = e.getAtividades();
        %>
        <div id="container">
            <%-- Incluindo o Menu --%>
            <%@include file="organ_menu.jsp"%>

            <div id="content">
                <h1 class="titulo">Gerenciar emissão de certificados <%=e.getNome()%></h1>
                <form action="../ServletCentral?comando=CmdUploadModeloCertificado&id_evento=<%=e.getId()%>" method="post" enctype="multipart/form-data" onsubmit="return checkFile();">
                    <div class="form-group">
                        <input type="file" name="arquivo" id="uploadFile"/>
                    </div>
                    <input type="submit" value="Enviar" class="btn btn-default"/>
                </form>
                <div class="info space-top text-info ">
                    <label>Deve ser feito o upload de um template seguindo os passos abaixo:</label><br/>
                    1º Faça o download do template de exemplo <a href="../resources/template.pptx"><b>AQUI</b></a>.<br/>
                    2º Abra com o Power Point<br/>
                    3º Edite o modelo de certificado ao seu gosto, porém deixe as caixas pretas como estão.<br/>
                    4º Depois apague as caixas pretas. (O sistema irá preencher esses espaços com informações do participante)<br/>
                    5º Salve o tempate em formato .jpg<br/>
                    6º Faça o upload do template.<br/>
                </div>  
            </div>
            <div class="footer-top">
                <%@include file="../footer.jsp" %>
            </div>
        </div>
    </body>
</html>
