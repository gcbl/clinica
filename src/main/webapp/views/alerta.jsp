<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>

<%--

Se quiser fazer fade in no alerta consultar o link abaixo
http://stackoverflow.com/questions/7676356/can-twitter-bootstrap-alerts-fade-in-as-well-as-out

 --%>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <div class="text-capitalize-first">
        <!-- ALERTAS -->        
            <!-- sucesso -->
            <c:if test="${not empty alertaSucesso}">
                <div class="animated fadeIn">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                      ${alertaSucesso}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>
            </c:if>
            <!-- /sucesso -->
            
            <!-- alertaInfo -->
            <c:if test="${not empty alertaInfo}">
                <div class="animated pulse">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                      ${alertaSucesso}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>    
            </c:if>
            <!-- /alertaInfo -->
            
            <!-- alertaWarning -->
            <c:if test="${not empty alertaWarning}">
                <div class="animated bounce">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                      ${alertaWarning}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>      
                </div>    
            </c:if>
            <!-- /alertaWarning -->
            
            <!-- alertaDanger -->
            <c:if test="${not empty alertaDanger}"> 
                <div class="animated shake">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                      <strong>Atenção!</strong><br/><br/> ${alertaDanger}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>      
                </div>    
            </c:if>
            <!-- /alertaDanger -->
          
        <!-- /ALERTAS -->
        </div>
    </div>
    <div class="col-2"></div>
</div>


