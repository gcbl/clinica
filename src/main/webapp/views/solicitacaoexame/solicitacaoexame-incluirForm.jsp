<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <form:form action="${acao}-${MODEL}" class="form-horizontal" commandName="${MODEL}" id="${acao}-${MODEL}"> 
                    <fieldset>
                    
                    <!-- Form Name -->
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>
                                        
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="dataSolicitacao">Data da Solicitacao:</label>  
                      <div class="col-md-4">
                      <form:input path="dataSolicitacao" placeholder="Data da Solicitação" class="form-control input-md" value="01/01/2018"/> <form:errors path="dataSolicitacao" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>

                    <!-- Select Input -->
                    <div class="form-group">
                          <label class="col-md-4 control-label" for="medicoSolicitante">Médico Solicitante:</label>  
                          <div class="col-md-4">
                              <form:select path="medicoSolicitante" id="selectMedicoSolicitanteList">
                                  <form:options items="${medicoSolicitanteList}" itemLabel="nome" />
                              </form:select>
                          </div>
                        </div>
                    </div>   

          
                    <!-- Select Input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente">Paciente:</label>  
                      <div class="col-md-4">
                          <form:select path="paciente" id="selectPacienteList">
                              <form:options items="${pacienteList}" itemLabel="nome" />
                          </form:select>
                      </div>
                    </div>   
                    
                    
                    <!-- Select Input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="exames">Exames:</label>  
                      <div class="col-md-4">
                          <form:select path="exames" id="selectExamesList" multiple="true">
                              <form:options items="${exameList}" itemLabel="nome" />
                          </form:select>
                      </div>
                    </div>                       
                                         
                    <!-- Button -->
                    <div class="form-group">
                      <div class="col-md-4">
                        <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Salvar</button>
                      </div>
                    </div>
                    
                    </fieldset>
                </form:form>
                   
                    
<script>

$(document).ready(function() {

    $('#selectMedicoSolicitanteList').select2({
        placeholder: "Selecione o médico solicitante",
        theme: "bootstrap",
        allowClear: true
    });	
	
	$('#selectPacienteList').select2({
    	  placeholder: "Selecione o paciente",
    	  theme: "bootstrap",
    	  allowClear: true
    });
    
    $('#selectExamesList').select2({
        placeholder: "Selecione os exames",
        theme: "bootstrap",
        allowClear: true
  });    
	
    
});
	
</script>
 
       
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>