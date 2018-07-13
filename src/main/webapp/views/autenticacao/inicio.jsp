<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <br>
            <h1 class="animated fadeInLeft">Bem vindo ${usuarioLogado.primeiroNome}!</h1>
            <br>

            <c:if test="${empty usuarioLogado.grupos}">
                <h4>Detectamos que voc� n�o foi inclu�do em nenhum grupo de trabalho e desta forma voc� n�o conseguir� utilizar o sistema.<br>Entre em contato com o administrador do sistema.</h3>
            </c:if>

            <br><br><br>
            
            <%--
            <p>O que voc� gostaria de fazer?</p>
            --%>
            
            <hr>
            <%--
            ${fn:length(principalLogado.principal.usuario.grupos)} grupos
            <hr>
            ${principalLogado.principal.usuario.grupos}
             --%>
            <hr>
            ${authentication}
            <hr>
            ${usuarioLogado}
            <hr>
            <c:if test="${empty usuarioLogado.grupos}">
            ${usuarioLogado.grupos}
            </c:if>
            <hr>
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>