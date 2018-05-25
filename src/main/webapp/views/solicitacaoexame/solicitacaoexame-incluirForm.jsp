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

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medicoSolicitante.id">Escolha o médico:</label>
                      <div class="col-md-4"><input id="inputAutoCompleteMedicoSolicitante" class="form-control input-md" placeholder="Busque o médico" /></div>   
                      <div class="col-md-4">
                          Médico: <div id="medicoSolicitanteEscolhido"></div>
                          <form:hidden path="medicoSolicitante.id" placeholder="medicoSolicitante.id" class="form-control input-md"/> <form:errors path="medicoSolicitante.id" cssClass="text-danger" />
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
        template: {
    		type: "custom",
    		method: function(value, item) {
    			return value + " - <span class='text-muted'><em> CPF:" + item.cpf + "</em></span>";
    		}
    	},		
	    list: {
	        onSelectItemEvent: function() {
	            var selectedItemValue = $("#inputAutoCompletePaciente").getSelectedItemData().id;
	            var selectedItemCpf = $("#inputAutoCompletePaciente").getSelectedItemData().cpf;
	            var selectedItemNome = $("#inputAutoCompletePaciente").getSelectedItemData().nome;

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
	
	
    var optionsInputAutoCompleteMedicoSolicitante = {
            url: function(phrase) {
                return "api/listar-medico-json?q=" + phrase;
            },
            theme: "bootstrap",
            getValue: function(element) {
                return element.nome;
            },
            template: {
        		type: "custom",
        		method: function(value, item) {
        			return value + " - <span class='text-muted'><em> CRM:" + item.crm + "</em></span>";
        		}
        	},
            list: {
                onSelectItemEvent: function() {
                    var selectedItemValue = $("#inputAutoCompleteMedicoSolicitante").getSelectedItemData().id;
                    var selectedItemCrm = $("#inputAutoCompleteMedicoSolicitante").getSelectedItemData().crm;
                    var selectedItemNome = $("#inputAutoCompleteMedicoSolicitante").getSelectedItemData().nome;

                    // mUDAR O TEXTO DO div
                    $('input[id="medico.id"]').val(selectedItemValue).trigger("change");
                    $("#medicoSolicitanteEscolhido").html( "<b>" + selectedItemCrm + ' - ' + selectedItemNome + "</b>");
                    $("#inputAutoCompleteMedicoSolicitante").val("");
                },
                onHideListEvent: function() {
                    //$("#inputTwo").val("").trigger("change");
                }
            }
        };
        $("#inputAutoCompleteMedicoSolicitante").easyAutocomplete(optionsInputAutoCompleteMedicoSolicitante);
	
</script>
 
       
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>