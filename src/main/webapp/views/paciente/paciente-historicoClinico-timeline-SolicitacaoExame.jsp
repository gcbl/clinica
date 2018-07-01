<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ page session="true"%>
<%@ page isELIgnored="false"%>
						
    <!-- timeline item 2 -->
    <div class="row">
        <div class="col-auto text-center flex-column d-none d-sm-flex">
            <div class="row h-50">
                <div class="col border-right border-secondary">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
            <h5 class="m-2 text-warning">
                <i class="fas fa-vials fa-fw fa-2x"></i>
                <!-- <span class="badge badge-pill bg-primary border">&nbsp;</span> -->
            </h5>
            <div class="row h-50">
                <div class="col border-right border-secondary">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
        </div>
        <div class="col py-2">
            <div class="card ">
                <div class="card-body">
                    <div class="float-right "><javatime:format value="${historicoClinicoSession.dataHistorico}" style="MS" /></div>
                    <h4 class="card-title "><i class="fas fa-vials"></i> ${TIPO}</h4>
                    <p class="card-text">
                        <div class="">
                            <div><i class="far fa-calendar"></i> <b>Data da solicita��o:</b> <div><fmt:formatDate value="${historicoClinicoSession.dataSolicitacao}" pattern="dd/MM/yyyy"/></div> </div>
                            <br>
                            <div><i class="fas fa-user-md"></i> <b>M�dico solicitante:</b> <div>${historicoClinicoSession.medicoSolicitante.nome}</div> </div>
                        </div>
                    </p>
                    <button class="btn btn-sm btn-outline-secondary" type="button" data-target="#t2_details_${TIPO}-${historicoClinicoSession.id}" data-toggle="collapse">Exames solicitados</button>
                    <div class="collapse border" id="t2_details_${TIPO}-${historicoClinicoSession.id}">
                        <div class="p-2 ">
                        	<br>
                            <c:forEach items="${historicoClinicoSession.exames}" var="itemList">
                            	<li>${itemList.nome}</li>
                            </c:forEach>
                            <br>
                            <c:if test="${not empty historicoClinicoSession.observacao}">
							    Observa��o: ${historicoClinicoSession.observacao}
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/row-->
						