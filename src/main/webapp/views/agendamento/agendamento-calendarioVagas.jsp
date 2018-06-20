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
        
        <hr>
            <h1>Marcar consulta <div id="nomeMedico">${medico.nome}</div> <div id="idMedico">${medico.id}</div></h1>
            <hr>
            <!-- Select input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="medico">Médico :</label>                
              <div class="col-md-4">
                  <select id="medico" style="width: 100%">
                        <option id="${medico.id}">${medico.nome}</option>
                  </select>
                  <%--
                  <form:select path="medico" id="medico" style="width: 100%">
                      <!-- No caso de estar editando -->

                      <c:if test="${not empty agendamento}">
                          <form:option value="${agendamento.medico.id}" label="${agendamento.medico.nome}" />
                      </c:if>
 
                  </form:select>
                  <form:errors path="medico" cssClass="text-danger" />
                  --%>
                  <!-- <span class="help-block">texto de help-block</span> -->
              </div>
            </div>
            
            <hr>
               <div id="calendar"></div>
            <hr>
        
            <h2 class="text-capitalize">Listar ${MODEL}</h2>
 
<!-- ########################################################################### -->
         <div class="table-responsive table-sm">
            <table id="itemDataTable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>data</th>
                            <th nowrap>horaInicio</th>
                            <th nowrap>horaFim</th>                            
                            <th>Medico</th>
                            <th>Paciente</th>
                            <th class="text-right"><a href="incluir-${MODEL}" class="btn btn-sm btn-success"><i class="fas fa-plus-circle"></i> Adicionar novo ${MODEL}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td data-order="<tags:localDate date="${item.data}" pattern="yyyyMMdd"/>"><tags:localDate date="${item.data}" pattern="dd/MM/yyyy"/></td>
                                <td nowrap>${item.horaInicio}</td>
                                <td nowrap>${item.horaFim}</td>
                                <td nowrap>${item.medico.nome}</td>
                                <td nowrap>${item.paciente.nome}</td>
                                <td class="actions text-right">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                      <a href="editar-${MODEL}?id=${item.id}" class="btn btn-sm btn-info"><i class="far fa-edit"></i> Editar</a>
                                      <a href="excluir-${MODEL}?id=${item.id}" class="btn btn-sm btn-danger"><i class="far fa-trash-alt"></i> Remover</a>
                                    </div>
                                </td>        
                            </tr>
                        </c:forEach>
                    </tbody>
                    <!-- 
                    <tfoot>
                        <tr>
                            <th>id</th>
                            <th>nomeGenerico</th>
                            <th>nomeFabrica</th>
                            <th>fabricante</th>
                            <th>concentracaoFormaFarmaceutica</th>
                        </tr>
                    </tfoot>
                     -->
            </table>
        </div>    
<hr> 
<!-- ########################################################################### -->
        </div>
 
<!-- ##### MODALS ##### -->
<div class="modal fade" id="agendamentoEventModal" role="dialog" aria-labelledby="agendamentoEventModal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
         <div class="modal-header">
             <h5 id="tituloModal"        class="modal-title"><b>Agendamento</b></h5>
             <h5 id="tituloModalMarcarSucesso" class="modal-title text-primary" ><b><i class="fas fa-check"></i> Horário <u>marcado</u> com sucesso!</b></h5>
             <h5 id="tituloModalDesmarcarSucesso" class="modal-title text-warning" ><b><i class="fas fa-check"></i> Horário <u>desmarcado</u> com sucesso!</b></h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
             </button>
         </div>
         <div class="modal-body">
         
             <div class="text-danger"><b>Agendamento:</b> <div id="modalBodyAgendamento"></div></div>
             <div><b>Médico:</b> <div id="modalBodyMedico"></div></div>
             <div><b>Horário:</b> <div id="modalBodyhorarioCompleto"></div></div>
             <div><b>Paciente:</b>
                    <div id="divPacienteSelect2"><select required id="pacienteSelect2" style="width: 100%"></select></div>
                    <div id="pacienteMarcado"></div>
             </div>
         </div>
         <div class="modal-footer">
             <button type="button" class="btn btn-primary" id="btnMarcarHorarioModal">Marcar horário</button>
             <button type="button" class="btn btn-warning" id="btnDesmarcarHorarioModal">Desmarcar horário</button>
             <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>             
         </div>
    </div>
  </div>
</div>

<!-- ##### FIM MODALS ##### --> 
<style> 
  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
  }
  
  .fc-sat {  background-color: #F2F2F2 }
  .fc-sun {  background-color: #F2F2F2 }
  
</style> 
 
<script>

var idMedico;
var idAgendamento;
var idPaciente;
$(document).ready(function() {
	beforeMarcarHorario();
	
	$('#pacienteMarcado').hide();
	
    idMedico = '${medico.id}';
    
    $('#calendar').fullCalendar({
        eventAfterAllRender: function( view ) {
            //beforeMarcarHorario();
        },
        // ---------------------------------------------------------------
        // Modal:
        eventClick:  function(event, jsEvent, view) {
            //alert('Event: ' + event.title);
            //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
            //alert('View: ' + view.name);
            //alert(event.color);
            //$('#tituloModal').html(event.medico);

            //var myJSON = JSON.stringify(event); 
            //alert(myJSON);

            idAgendamento = event.id;
            idPaciente = event.idPaciente;
            $('#modalBodyAgendamento').text(event.id);
            $('#modalBodyMedico').text(event.medico);
            $('#modalBodyhorarioCompleto').text(event.horarioCompleto);
            
            configuraModal(event);
            
            $('#agendamentoEventModal').modal();
        },        
        // ---------------------------------------------------------------
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month, basicWeek, agendaDay, listWeek'
        },
        themeSystem: 'bootstrap4', 
        aspectRatio: 1,
        height: 650,
        eventLimit: true, // allow "more" link when too many events
        // put your options and callbacks here
        eventSources: [
              // your event source
              {
                  url: 'api/fullcalendar-listar-horario-ocupado-json?idMedico=' + idMedico,  // use the 'url' property
                  //color: 'yellow',    // an option!
                  //textColor: 'black'  // an option!
              },
              {
                  url: 'api/fullcalendar-listar-horario-vago-json?idMedico=' + idMedico,  // use the 'url' property
                  //color: 'white',    // an option!
                  //textColor: 'black'  // an option!
              }
              
        ]
       
      })    


    // Select2
    $('#medico').on('select2:select', function (event) {
        // Do something
        // alert(JSON.stringify(event.params.data, null, 4));
        idMedico = event.params.data.id;
        $('#idMedico').text(idMedico);
        window.location.replace("exibir-calendario-vagas-agendamento-medico?idMedico=" + idMedico);
        //$('#calendar').fullCalendar( 'refetchEvents');
    });
    
    $('#medico').select2({
        placeholder: "Selecione o médico",
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
      
    $('#pacienteSelect2').select2({
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
    
    $('#pacienteSelect2').on('select2:select', function (event) {
        // Do something
        // alert(JSON.stringify(event.params.data, null, 4));
        idPaciente = event.params.data.id;
        var nomePaciente = event.params.data.nome;
        $('#pacienteMarcado').text(nomePaciente);

        habilitaBotao('btnMarcarHorarioModal', 'btn-primary')
    });
      
    // Datatable
    var table = $('#itemDataTable').DataTable( {
        responsive: true,
        dom: 'Bfrtip',
        buttons: [ 
                  {
                       extend: 'colvis',
                       text: 'Colunas',
                       columnText: function ( dt, idx, title ) { return (idx+1)+': '+title; }
                   }
                 ],
        "paging":   true,
        "ordering": true,
        "columnDefs": [ { orderable: false, targets: -1 } ], // desabilita sort da ultima coluna 
        "order": [[ 1, "asc" ]],
        "info":     true,       
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese.json"
        }
    } ); 

} );


    /**
     * Marcando consulta
     */
     $( "#btnMarcarHorarioModal" ).click(function() {
    	$.ajax({
			url : "api/marcar-horario-ajax-json",
			type : 'POST',
			data : {
				idAgendamento : idAgendamento,
				idPaciente : idPaciente
			},
			beforeSend : function() {
				// $("#resultado").html("ENVIANDO...");
				// alert('antes de enviar a requicocao http');
				// $("#btnMarcarHorarioModal").text("Marcando horário...");
				desabilitaBotao('btnMarcarHorarioModal', 'btn-light');
			}
		}).done(function(msg) {
			afterMarcarHorario();
		}).fail(function(jqXHR, textStatus, msg) {
			habilitaBotao('btnMarcarHorarioModal', 'btn-primary');
			alert('problema na hora de marcar a consulta!');
 		});
	 });

    /**
     * Desmarcando consulta
     */
     $( "#btnDesmarcarHorarioModal" ).click(function() {
         $.ajax({
             url : "api/desmarcar-horario-ajax-json",
             type : 'POST',
             data : {
                 idAgendamento : idAgendamento,
                 idPaciente : idPaciente
             },
             beforeSend : function() {
                 //$("#btnMarcarHorarioModal").text("Desmarcando horário...");
                 //alert('antes de enviar a requicocao http');
             }
         }).done(function(msg) {
             afterDesmarcarHorario();
         }).fail(function(jqXHR, textStatus, msg) {
             //alert('fail');
             alert('problema na hora de desmarcar a consulta!');
         });
     });
   

	$("#agendamentoEventModal").on('hidden.bs.modal', function(e) {
	    // window.location.replace("exibir-calendario-vagas-agendamento-medico?idMedico=" + idMedico);
		beforeMarcarHorario();
    });

	/**
	 *
	 */
	function configuraModal(event){
		$('#pacienteMarcado').text(event.paciente);
		
		if(event.vago){
			desabilitaBotao('btnMarcarHorarioModal','btn-light')
			desabilitaBotao('btnDesmarcarHorarioModal','btn-light')
			
			$('#divPacienteSelect2').show();
	        $('#pacienteMarcado').hide();
		}else{
            desabilitaBotao('btnMarcarHorarioModal','btn-light')
            habilitaBotao('btnDesmarcarHorarioModal','btn-warning')
            
            $('#divPacienteSelect2').hide();
            $('#pacienteMarcado').show();
		}
	}

	/*
	function habilitaBotao(idBotao, classe){
		$('#' + idBotao).prop("disabled", false);
		setButtonClass(idBotao, classe)
	}
	
    function desabilitaBotao(idBotao, classe){
        $('#' + idBotao).prop("disabled", true);
        setButtonClass(idBotao, classe)
    }
	
    function setButtonClass(idBotao, classe){    
        $('#' + idBotao).removeClass();
        $('#' + idBotao).addClass('btn');
        $('#' + idBotao).addClass(classe);
    }
    */

    
    /**
     *
     */
	function beforeMarcarHorario(){
        $('#tituloModalMarcarSucesso').hide();
        $('#tituloModalDesmarcarSucesso').hide();
        $('#tituloModal').show();
        
        desabilitaBotao('btnMarcarHorarioModal', 'btn-light');
        desabilitaBotao('btnDesmarcarHorarioModal', 'btn-light');
        
        $('#pacienteSelect2').val('').trigger('change'); // Zerar o select
        $('#divPacienteSelect2').show();
        
        $('#pacienteMarcado').hide();		
	}

    /**
     *
     */
    function afterMarcarHorario(){
        $('#tituloModal').hide();
        $('#tituloModalDesmarcarSucesso').hide();

        $('#tituloModalMarcarSucesso').addClass('animated bounceIn');
        $('#tituloModalMarcarSucesso').show();
        
        
        desabilitaBotao('btnMarcarHorarioModal', 'btn-light');
        habilitaBotao('btnDesmarcarHorarioModal', 'btn-warning');
        
        
        $('#divPacienteSelect2').hide();
        $('#pacienteMarcado').show();
        
        $('#calendar').fullCalendar( 'refetchEvents');
    }
    
    function afterDesmarcarHorario(){
        $('#tituloModal').hide();
        $('#tituloModalMarcarSucesso').hide();
        
        $('#tituloModalDesmarcarSucesso').addClass('animated bounceIn');
        $('#tituloModalDesmarcarSucesso').show();
        
        $('#pacienteMarcado').hide();
        $('#pacienteSelect2').val('').trigger('change'); // Zerar o select
        $('#divPacienteSelect2').show();
        
        
        $('#btnMarcarHorarioModal').prop("disabled", false);
        $('#btnDesmarcarHorarioModal').prop("disabled", true);
        
        desabilitaBotao('btnMarcarHorarioModal', 'btn-light');
        desabilitaBotao('btnDesmarcarHorarioModal', 'btn-light');        
        
        $('#calendar').fullCalendar( 'refetchEvents');
    }    
	
	
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>