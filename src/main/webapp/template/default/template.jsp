<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
    <head>
        <tiles:insertAttribute name="head" />
    </head>
<body>
	<%-- Verificando as roles --%>
    <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdminSec" />
	<sec:authorize access="hasRole('ROLE_MEDICO')" var="isMedicoSec" />
	<sec:authorize access="hasRole('ROLE_RECEPCIONISTA')" var="isRecepcionistaSec" />
	<%-- /Verificando as roles --%>

	<%-- Importando o menu de acordo com as roles --%>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	    <tiles:insertAttribute name="menu" />
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_MEDICO')">
        <tiles:insertAttribute name="menu-medico" />
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_RECEPCIONISTA')">
	    <tiles:insertAttribute name="menu-recepcionista" />
	</sec:authorize>
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