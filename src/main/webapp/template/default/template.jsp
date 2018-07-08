<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
    <head>
        <tiles:insertAttribute name="head" />
    </head>
<body>
	<%-- Verificando as roles --%>
    <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"  />
	<sec:authorize access="hasRole('ROLE_MEDICO')" var="isMedico" />
	<sec:authorize access="hasRole('ROLE_RECEPCIONISTA')" var="isRecepcionista" />
	<%-- /Verificando as roles --%>

	<%-- Importando o menu de acordo com as roles --%>
    <c:choose>
        <c:when test = "${isAdmin}">
	        <tiles:insertAttribute name="menu-admin" />
        </c:when>
        <c:when test = "${isMedico}">
            <tiles:insertAttribute name="menu-medico" />
        </c:when>
        <c:when test = "${isRecepcionista}">
     	    <tiles:insertAttribute name="menu-recepcionista" />
        </c:when>
        <c:otherwise>
            <tiles:insertAttribute name="menu" />
        </c:otherwise>
    </c:choose>
	<%-- /Importando o menu de acordo com as roles --%>

    <tiles:insertAttribute name="cabecalho" />
    
    <div class="container-fluid">
      <div class="row">
        <!-- <div class="col-sm-1">&nbsp;</div> -->
        <div class="col-sm-12">
            
            <tiles:insertAttribute name="body" />
             
        </div>
        <!-- <div class="col-sm-1">&nbsp;</div> -->
      </div>
    </div>    
        
 
<%--
    <div class="content">
        <tiles:insertAttribute name="body" />
    </div>
 --%>
     <tiles:insertAttribute name="rodape" />
    
    
    
</body>
</html>