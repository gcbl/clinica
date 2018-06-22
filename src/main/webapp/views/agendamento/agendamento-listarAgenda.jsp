<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


 
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
    <c:out value="${pageContext.request.locale.language}"/>  
 
        <div class="body">
            <h2 class="text-capitalize">Listar ${MODEL}</h2>
<!-- ########################################################################### --> 
<hr>
    <c:forEach items="${itemList}" var="item">
        <div class="row row-striped">
            <div class="col-2 text-right">
                <h1 class="display-4"><span class="badge badge-secondary"><tags:localDate date="${item.data}" pattern="dd"/></span></h1>
                <h4><tags:localDate date="${item.data}" pattern="MMM/YY"/></h4>
            </div>
            <div class="col-10">
                <h3 class="text-capitalize"><strong>${item.paciente.nome} </strong></h3>
                <ul class="list-inline">
                    <li class="list-inline-item"><i class="far fa-calendar"></i> <tags:localDate date="${item.data}" pattern="EEEE"/></li>
                    <li class="list-inline-item"><i class="far fa-clock"></i> das ${item.horaInicio} até ${item.horaFim} </li>
                    <!-- <li class="list-inline-item"><i class="fa fa-location-arrow" aria-hidden="true"></i> Cafe</li> -->
                </ul>
                <ul class="list-inline">
                    <li class="list-inline-item"><h5><i class="fas fa-user-md"></i> ${item.medico.nome}</h5></li>
                </ul>
                <!-- <p><i class="fas fa-user-md"></i> ${item.medico.nome} </p> -->
                <!--  <h5 class="text-capitalize"><strong><i class="fas fa-user-md"></i> ${item.medico.nome} </strong></h5> -->
            </div>
        </div>
    </c:forEach>     
<hr>
<!-- ########################################################################### -->
<hr>
        <div class="">
            <c:forEach items="${itemList}" var="item">
                    ${item}
            </c:forEach>
        </div>    
                
<hr> 
<!-- ########################################################################### -->
        </div>
 
<!-- ##### MODALS ##### -->

<!-- ##### FIM MODALS ##### -->
<style>
        .row-striped:nth-of-type(odd){
          background-color: #efefef;
          border-left: 4px #000000 solid;
        }
        
        .row-striped:nth-of-type(even){
          background-color: #ffffff;
          border-left: 4px #efefef solid;
        }
        
        .row-striped {
            padding: 15px 0;
        } 
</style> 
 
<script> </script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>