<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="header">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

<%-- -- ALERTA --  --%> 
<c:import url="../alerta.jsp"/>
<%-- -- ALERTA --  --%>


<div class="ribbon ribbon-${usuarioLogado.tipo}"><span>${usuarioLogado.tipo}</span></div>
