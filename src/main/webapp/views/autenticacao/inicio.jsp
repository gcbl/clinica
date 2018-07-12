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
            <h1 class="animated fadeInLeft">Bem vindo ${principalLogado.principal.usuario.primeiroNome}!</h1>
            <br>

            <c:if test="${empty principalLogado.principal.usuario.grupos}">
                <h4>Detectamos que você não foi incluído em nenhum grupo de trabalho e desta forma você não conseguirá utilizar o sistema.<br>Entre em contato com o administrador do sistema.</h3>
            </c:if>

            <br><br><br>
            
            <%--
            <p>O que você gostaria de fazer?</p>
            --%>
            
            <hr>
            ${fn:length(principalLogado.principal.usuario.grupos)} grupos
            <hr>
            ${principalLogado.principal.usuario.grupos}
            <hr>
            ${principalLogado}
            <hr>
            ${usuariolLogado}


            <hr>
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>