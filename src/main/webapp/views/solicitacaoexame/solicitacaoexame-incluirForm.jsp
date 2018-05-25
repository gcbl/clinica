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
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente.id">Escolha o paciente:</label>
                      <div class="col-md-4"><input id="inputAutoCompletePaciente" class="form-control input-md" placeholder="paciente" /></div>   
                      <div class="col-md-4">
                          Paciente: <div id="pacienteEscolhido"></div>
                          <form:hidden path="paciente.id" placeholder="paciente.id" class="form-control input-md"/> <form:errors path="paciente.id" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                                        
 <%--                        
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medicoSolicitante.id">Medico solicitante:</label>  
                      <div class="col-md-4">
                      <form:input path="medicoSolicitante.id" placeholder="Medico solicitante" class="form-control input-md"/> <form:errors path="medicoSolicitante.id" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
--%>                    
                    
                                        
                    <!-- Button -->
                    <div class="form-group">
                      <div class="col-md-4">
                        <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Salvar</button>
                      </div>
                    </div>
                    
                    </fieldset>
                </form:form>
                   
                    
<script>
    var optionsInputAutoCompletePaciente = {
	    url: function(phrase) {
	        return "api/listar-paciente-json?q=" + phrase;
	    },
	    theme: "bootstrap",
	    getValue: function(element) {
	        return element.nome;
	    },
	    list: {
	        onSelectItemEvent: function() {
	            var selectedItemValue = $("#inputAutoCompletePaciente").getSelectedItemData().id;
	            var selectedItemCpf = $("#inputAutoCompletePaciente").getSelectedItemData().cpf;
	            var selectedItemNome = $("#inputAutoCompletePaciente").getSelectedItemData().nome;

	            // mUDAR O TEXTO DO div
	            $('input[id="paciente.id"]').val(selectedItemValue).trigger("change");
	            $("#pacienteEscolhido").html( "<b>" + selectedItemCpf + ' - ' + selectedItemNome + "</b>");
	            $("#inputAutoCompletePaciente").val("");
	        },
	        onHideListEvent: function() {
	            //$("#inputTwo").val("").trigger("change");
	        }
	    }
	};
	$("#inputAutoCompletePaciente").easyAutocomplete(optionsInputAutoCompletePaciente);
	
	
    var optionsInputAutoCompleteMedico = {
            url: function(phrase) {
                return "api/listar-paciente-json?q=" + phrase;
            },
            theme: "bootstrap",
            getValue: function(element) {
                return element.nome;
            },
            list: {
                onSelectItemEvent: function() {
                    var selectedItemValue = $("#inputAutoCompleteMedico").getSelectedItemData().id;
                    var selectedItemCpf = $("#inputAutoCompleteMedico").getSelectedItemData().cpf;
                    var selectedItemNome = $("#inputAutoCompleteMedico").getSelectedItemData().nome;

                    // mUDAR O TEXTO DO div
                    $('input[id="medico.id"]').val(selectedItemValue).trigger("change");
                    $("#medicoEscolhido").html( "<b>" + selectedItemCpf + ' - ' + selectedItemNome + "</b>");
                    $("#inputAutoCompleteMedico").val("");
                },
                onHideListEvent: function() {
                    //$("#inputTwo").val("").trigger("change");
                }
            }
        };
        $("#inputAutoCompleteMedico").easyAutocomplete(optionsInputAutoCompleteMedico);
	
</script>
 
       
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>