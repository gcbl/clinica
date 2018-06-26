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
            <h2 class="text-capitalize">Historico clinico ${MODEL}</h2>
 
<!-- ########################################################################### -->
			<hr>
			
			   <c:import url="paciente-historicoClinico-timeline-Fim.jsp"/>
			   <c:forEach var="historicoClinico" items="${historicoClinicoList}">
			   		<%-- Detectando o TIPO --%>
			   		<c:set var="TIPO"                    scope="session" value="${historicoClinico['class'].simpleName }"/>
			        <c:set var="historicoClinicoSession" scope="session" value="${historicoClinico}" />
			
			        <c:import url="paciente-historicoClinico-timeline-${TIPO}.jsp"/>
			   </c:forEach>
			   <c:import url="paciente-historicoClinico-timeline-Inicio.jsp"/>
			   
			<hr> 
<!-- ########################################################################### -->
        </div>

<%-- 
<c:set var="TIPO"                    scope="session" value="1"/>
<c:set var="historicoClinicoSession" scope="session" value="1" />
<c:set var="historicoClinicoList" scope="session" value="1" />

<c:remove var="TIPO"/>
<c:remove var="historicoClinicoSession"/>
<c:remove var="historicoClinicoList"/>
--%>
 
<!-- ##### MODALS ##### -->

<!-- ##### FIM MODALS ##### --> 
 
<script>
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>