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
                    
                    <form:select path="paciente">
                         <form:option value="-" label="--Please Select"/>
                         <form:options items="${solicitacaoexame-pacientes}" itemValue="id" itemLabel="nome"/>
                    </form:select>                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente.id">Paciente:</label>  
                      <div class="col-md-4">
                      <input id="inputOne" class="form-control input-md" placeholder="paciente" />
                      <br><br><br><br><br><br><br><br><br><br><br><br>
                      <input id="inputTwo" placeholder="id" />
                      <br>
                      <form:input path="paciente.id" placeholder="Paciente" class="form-control input-md"/> <form:errors path="paciente.id" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medicoSolicitante.id">Medico solicitante:</label>  
                      <div class="col-md-4">
                      <form:input path="medicoSolicitante.id" placeholder="Medico solicitante" class="form-control input-md"/> <form:errors path="medicoSolicitante.id" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
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
var options = {

	    url: "api/listar-all-paciente-json",
	    theme: "bootstrap",
	    getValue: function(element) {
	        return element.nome;
	    },

	    list: {
	        onSelectItemEvent: function() {
	            var selectedItemValue = $("#inputOne").getSelectedItemData().id;

	            
	            $("#inputTwo").val(selectedItemValue).trigger("change");
	            $('input[id="paciente.id"]').val(selectedItemValue).trigger("change");
	        },
	        onHideListEvent: function() {
	            //$("#inputTwo").val("").trigger("change");
	        }
	    }
	};

	$("#inputOne").easyAutocomplete(options);
</script>
 
       
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>