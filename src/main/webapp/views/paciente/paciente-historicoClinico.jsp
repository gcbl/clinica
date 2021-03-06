<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
 
<!-- ########################################################################### -->
               <a name="inicioHistorico"></a>
               <br><br>
               <c:import url="paciente-historicoClinico-timeline-FichaPessoal.jsp"/>
               <br><br><br> 
               <h2 class="text-capitalize"><i class="fas fa-clipboard-list"></i> Hist�rico cl�nico de ${paciente.nome}</h2>
               <br><br>                
               <c:choose>
                  <c:when test = "${empty historicoClinicoList}">
                       <c:import url="paciente-historicoClinico-timeline-Fim.jsp"/>
                  </c:when>
                  <c:otherwise>
                      <%-- Timeline do historico --%>
                      <c:import url="paciente-historicoClinico-timeline-Inicio.jsp"/>
                      <c:forEach var="historicoClinico" items="${historicoClinicoList}">
                           <%-- Detectando o TIPO --%>
                           <c:set var="TIPO"                    scope="session" value="${historicoClinico['class'].simpleName }"/>
                           <c:set var="historicoClinicoSession" scope="session" value="${historicoClinico}" />
                   
                           <c:import url="paciente-historicoClinico-timeline-${TIPO}.jsp"/>
                      </c:forEach>
                      <c:import url="paciente-historicoClinico-timeline-Fim.jsp"/>
                      <%-- /Timeline do historico --%>
                  </c:otherwise>
               </c:choose>
			<hr> 
<!-- ########################################################################### -->
        </div>

<%-- 
<c:set var="TIPO"                    scope="session" value="1"/>
<c:set var="historicoClinicoSession" scope="session" value="1" />
<c:set var="historicoClinicoList" scope="session" value="1" />
--%>

<c:remove var="TIPO"/>
<c:remove var="historicoClinicoSession"/>
<c:remove var="historicoClinicoList"/>

 
<!-- ##### MODALS ##### -->

<!-- ##### FIM MODALS ##### --> 
 
<script>
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>