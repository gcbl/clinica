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
            <h1>CALENDARIO</h1>
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
                                <td data-order="${item.data}"><%-- <fmt:formatDate value="${item.data}" pattern="dd/MM/yyyy"/>  --%> ${item.data} </td>                                
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

<!-- ##### FIM MODALS ##### --> 
<style> 
  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
  }
</style> 
 
<script>
$(document).ready(function() {
    
	// fullcalendar.io
	$('#calendar').fullCalendar({
		header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month, agendaWeek, agendaDay, listMonth, listWeek, basicWeek'
	    },
		themeSystem: 'bootstrap4', 
	    aspectRatio: 1,
	    height: 650,
	    // put your options and callbacks here
	    eventSources: [
              // your event source
              {
                url: 'api/listar-evento-json',  // use the 'url' property
                //color: 'yellow',    // an option!
                //textColor: 'black'  // an option!
              }
        ]
/*              
	    events: [
              {
                title: 'Meeting',
                start: '2018-03-12T10:30:00',
                end: '2018-03-12T12:30:00'
              },
              {
                title: 'Lunch',
                start: '2018-03-12T12:00:00'
              },
              {
                title: 'Meeting',
                start: '2018-03-12T14:30:00'
              },
              {
                title: 'Happy Hour',
                start: '2018-03-12T17:30:00'
              },
              {
                title: 'Dinner',
                start: '2018-03-12T20:00:00'
              },
              {
                title: 'Birthday Party',
                start: '2018-03-13T07:00:00'
              },
              {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2018-03-28'
              }
	    ]
*/              
	  })
	
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
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>