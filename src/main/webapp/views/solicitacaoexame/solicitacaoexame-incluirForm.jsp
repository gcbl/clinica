<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <H1><div class="text-danger">As mensagens de erro de validacao não estão aparecendo!</div></H1>

                <form:form action="${acao}-${MODEL}" class="form-horizontal" commandName="${MODEL}" id="${acao}-${MODEL}"> 
                    <fieldset>
                    
                    <!-- Form Name -->
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>

                    <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="dataSolicitacao">Data da Solicitacao:</label>  
                      <div class="col-md-4">
                      <form:input path="dataSolicitacao" placeholder="Data da Solicitação" class="form-control input-md"/>
                      <form:errors path="dataSolicitacao" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>

          
                    <!-- Select Input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente">Paciente:</label>  
                      <div class="col-md-4">
                          <form:select path="paciente" id="selectPacienteList" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty solicitacaoexame}">
                                  <form:option value="${solicitacaoexame.paciente.id}" label="${solicitacaoexame.paciente.nome}" />
                              </c:if>
                          </form:select>
                      </div>
                      <form:errors path="paciente" cssClass="text-danger" />
                    </div>   
                    
                    
                    <!-- Select Input -->
                    <div class="form-group">
                          <label class="col-md-4 control-label" for="medicoSolicitante">Médico Solicitante:</label>  
                          <div class="col-md-4">
                              <form:select path="medicoSolicitante" id="selectMedicoSolicitanteList" style="width: 100%">
                                  <%-- No caso de estar editando --%>
                                  <c:if test="${not empty solicitacaoexame}">
                                      <form:option value="${solicitacaoexame.medicoSolicitante.id}" label="${solicitacaoexame.medicoSolicitante.nome}" />
                                  </c:if>
                              </form:select>
                          </div>
                        </div>
                        <form:errors path="medicoSolicitante" cssClass="text-danger" />
                    </div>
                       
                    
                    <!-- Select Input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="exames">Exames:</label>  
                      <div class="col-md-4">
                          <form:select path="exames" id="selectExamesList" multiple="true" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty solicitacaoexame}">
                                  <form:options items="${solicitacaoexame.exames}" itemValue="id" itemLabel="nome"/>
                              </c:if>
                              
                          </form:select>
                      </div>
                    </div>                    
                    
                    <!-- Textarea input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="observacao">Observação:</label>  
                      <div class="col-md-4">
                      <form:textarea path="observacao" placeholder="Observação" rows="3" class="form-control input-md"/>
                      <form:errors path="observacao" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                                         
                    <!-- Button -->
                    <div class="form-group">
                      <div class="col-md-4">
                        <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Solicitar exame</button>
                      </div>
                    </div>
                    
                    </fieldset>
                </form:form>
                   
                    
<script>

$(document).ready(function() {
	// Open select2 on focus
	$(document).on('focus', '.select2', function (e) {
		  if (e.originalEvent) {
		    $(this).siblings('select').select2('open');    
		  } 
    });
	
	
    $('#selectMedicoSolicitanteList').select2({
        placeholder: "Selecione o médico solicitante",
        language: "pt-BR",        
        theme: "bootstrap",
        allowClear: true,
        minimumInputLength: 1,
        closeOnSelect: true,
        ajax: {
            url: 'api/listar-medico-json',
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
	
	$('#selectPacienteList').select2({
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
    
    $('#selectExamesList').select2({
        placeholder: "Selecione os exames",
        language: "pt-BR",
        theme: "bootstrap",
        allowClear: true,
        minimumInputLength: 1,
        closeOnSelect: true,
        ajax: {
            url: 'api/listar-exame-json',
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
 
       
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>