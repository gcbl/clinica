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

                <%-- <form:form action="${acao}-${MODEL}" class="form-horizontal" modelAttribute="${MODEL}" id="${acao}-${MODEL}"> --%>
                <form action="${acao}-historico-clinico-${MODEL}" method="POST">
                    <fieldset>
                    
                    <!-- Form Name -->
                    <hr>
                    <div class="form-group">
                        <h2 class="text-capitalize">&nbsp;Histórico Clínico ${MODEL}</h2>
                    </div>
                    <br>           
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente">Paciente:</label>  
                      <div class="col-md-4">
                          <select name="id" id="paciente" style="width: 100%">
                          </select>
                          <form:errors path="paciente" cssClass="text-danger" />
                          <c:if test="${pacienteVazio}">
                                <span id="nome.errors" class="text-danger">*Por favor informe o paciente</span>
                          </c:if>
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                      <div class="col-md-4">
                      <br>
                        <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Exibir histórico clínico</button>
                      </div>
                    </div>
                    
                    </fieldset>
                </form>
                <%-- </form:form> --%>
                
            
            <hr>
           
        </div>
 
<script>
 $(document).ready(function() {
 
	    $('#paciente').select2({
	          placeholder: "Selecione o paciente",
	          language: "pt-BR",          
	          theme: "bootstrap",
	          allowClear: true,
	          minimumInputLength: 1,
	          closeOnSelect: true,
	          ajax: {
	              url: 'api/listar-paciente-json',
	              dataType: 'json',
	              processResults: function (data, params) {
	                    
	                    var resultsData = $.map(data, function (obj) {
	                      obj.id = obj.id || obj.nome; // replace name with the property used for the text
	                      obj.text = obj.text || obj.nome; // replace name with the property used for the text
	                      return obj;
	                    });

	                    return {
	                      results: resultsData
	                    };
	                  },
	          }
	    });	 

	 
 });
</script>
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>