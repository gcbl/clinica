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
            <h5 class="m-2 text-success">
                <i class="fas fa-file-medical fa-fw fa-2x"></i>
                <!-- <span class="badge badge-pill bg-primary border">&nbsp;</span> -->
            </h5>
            <div class="row h-50">
                <div class="col border-right border-secondary">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
        </div>
        <div class="col py-2">
            <div class="card">
                <div class="card-body bg-warning">
                    <div class="float-right "><javatime:format value="${historicoClinicoSession.dataHistorico}" style="MS" /></div>
                    <h4 class="card-title "><i class="fas fa-file-medical"></i> ${TIPO}</h4>
                    <p class="card-text">
                        <div class="">
                            <div><i class="far fa-calendar-alt"></i> <b>Data do recebimento:</b> <div>COLOQUE AQUI A DATA</div> </div>                            
                            <br>                            
                            <div><i class="fas fa-flask"></i> <b>Laboratório:</b> <div>${historicoClinicoSession}</div> </div>
                            <br>
                            <div><i class="far fa-calendar-alt"></i> <b>Data do exame:</b> <div>COLOQUE AQUI A DATA</div> </div>                            
                            <br>
                            <div><i class="fas fa-user-md"></i> <b>Responsavél técnico:</b> <div>${historicoClinicoSession.anexos}</div> </div>                            
							<br>
                            <div><i class="fas fa-globe"></i> <b>Disponível para o paciente:</b> <div>${historicoClinicoSession.disponibilizadoPaciente}</div> </div>
                            <br>
                            <div><i class="fas fa-paperclip"></i> <b>Anexos:</b> <div>${historicoClinicoSession.anexos}</div> </div>                            
                        </div>
                    </p>
                    <div><i class="fas fa-file-medical"></i> <b>Resultados:</b> <div>${historicoClinicoSession.anexos}</div> </div>                            
                    <button class="btn btn-sm btn-outline-secondary" type="button" data-target="#t2_details_${TIPO}-${historicoClinicoSession.id}" data-toggle="collapse"><i class="fas fa-file-medical"></i> Resultado do exame</button>
                    <div class="collapse border" id="t2_details_${TIPO}-${historicoClinicoSession.id}">
                        <div class="p-2 ">
                        	<br>
                                <ul>
                                    <li>${historicoClinicoSession.resultado}</li>
                                </ul>
                            <%--
                            <c:forEach items="${historicoClinicoSession.exames}" var="itemList">
                            	<li>${itemList.nome}</li>
                            </c:forEach>
                            <br>
                            <c:if test="${not empty historicoClinicoSession.observacao}">
							    Observação: ${historicoClinicoSession.observacao}
							</c:if>
                            --%>
                        </div>
                    </div>
                    <br><br>
                    
                </div>
            </div>
        </div>
    </div>
    <!--/row-->
						