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
            <!-- primary -->
            <c:if test="${not empty alertaPrimary}">
                <div class="animated fadeIn">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                      ${alertaPrimary}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>
            </c:if>
            <!-- /primary -->        
        
            <!-- secondary  -->
            <c:if test="${not empty alertaSecondary}">
                <div class="animated fadeIn">
                    <div class="alert alert-secondary alert-dismissible fade show" role="alert">
                      ${alertaSecondary}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>
            </c:if>
            <!-- /secondary  -->            
        
            <!-- success -->
            <c:if test="${not empty alertaSuccess}">
                <div class="animated bounce">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                      ${alertaSuccess}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>
            </c:if>
            <!-- /success -->
            
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
            
            <!-- alertaInfo -->
            <c:if test="${not empty alertaInfo}">
                <!--  <div class="animated pulse"> -->
                <div class="animated bounce">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                      ${alertaInfo}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>    
            </c:if>
            <!-- /alertaInfo -->
            
            <!-- alertaLight -->
            <c:if test="${not empty alertaLight}">
                <!--  <div class="animated pulse"> -->
                <div class="animated bounce">
                    <div class="alert alert-light alert-dismissible fade show" role="alert">
                      ${alertaLight}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>    
            </c:if>
            <!-- /alertaInfo -->

            <!-- alertaDark -->
            <c:if test="${not empty alertaDark}">
                <!--  <div class="animated pulse"> -->
                <div class="animated bounce">
                    <div class="alert alert-dark alert-dismissible fade show" role="alert">
                      ${alertaDark}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </div>    
            </c:if>
            <!-- /alertaInfo -->
            

          
        <!-- /ALERTAS -->
        </div>
    </div>
    <div class="col-2"></div>
</div>


