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
            <h2 class="text-capitalize">Listar ${MODEL}</h2>
 
<!-- ########################################################################### -->
         <div class="table-responsive table-sm">
            <table id="itemDataTable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th nowrap>Grupo</th>
                            <th nowrap>Descricao</th>                            
                            <th>Permissões</th>
                            <th>Usuários</th>
                            <th class="text-right"><a href="incluir-${MODEL}" class="btn btn-sm btn-success"><i class="fas fa-plus-circle"></i> Adicionar novo ${MODEL}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td nowrap>${item.id}</td>
                                <td nowrap>${item.nome}</td>
                                <td nowrap>${item.descricao}</td>
                                <td>${fn:length(item.permissoes)} permissões</td>
                                <td>
                                    <ul>
                                        <c:forEach items="${item.usuarios}" var="itemList">
                                            <li>${itemList['class'].simpleName} ${itemList.nome}</li>
                                        </c:forEach>
                                    </ul>
                                </td>
                                <td class="actions text-right">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                      <a href="#" id="btnUsuarios" class="btn btn-sm btn-primary"><i class="fas fa-users"></i> Usuários</a>                               
                                      <a href="editar-${MODEL}-usuario?id=${item.id}" class="btn btn-sm btn-primary"><i class="far fa-edit"></i> Permissões</a>&nbsp;&nbsp;
                                      <a href="editar-${MODEL}?id=${item.id}" class="btn btn-sm btn-primary"><i class="far fa-edit"></i> Permissões</a>&nbsp;&nbsp;
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

<div class="modal fade" id="grupoUsuariosModal" role="dialog" aria-labelledby="grupoUsuariosModal" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
         <div class="modal-header">
             <h5 id="tituloModal"        class="modal-title"><i class="fas fa-users"></i> <b>Usuários do grupo</b></h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
             </button>
         </div>
         <div class="modal-body">
             <!-- <div class="text-danger"><b>Agendamento:</b> <div id="modalBodyAgendamento"></div></div> -->
             <div><i class="fas fa-user-md"></i> <b>qualquer coisa:</b> <div id="modalBodyMedico"></div></div>
             <br>
             <br>
             <div><b>Usuários:</b>
                    <div id="divUsuariosSelect2"><select id="usuariosSelect2" multiple="true" required style="width: 100%"></select></div>
<%-- 
                    <form:select path="medicamentos" multiple="true" style="width: 100%">
                        <c:if test="${not empty receita}">
                            <form:options items="${receita.medicamentos}" itemValue="id" itemLabel="nomeCompleto"/>
                        </c:if>
                    </form:select>
--%>
                    
             </div>
             <br>
             <hr>
             <div class="text-center">
                 <button type="button" class="btn btn-primary" id="btnMarcarHorarioModal"><i class="far fa-calendar-check"></i> Salvar</button>
             </div>
         </div>
         <div class="modal-footer">
             <!-- 
             <button type="button" class="btn btn-primary" id="btnMarcarHorarioModal"><i class="far fa-calendar-check"></i> Marcar horário</button>
             <button type="button" class="btn btn-warning" id="btnDesmarcarHorarioModal"><i class="far fa-calendar-times"></i> Desmarcar horário</button>
             <button type="button" class="btn btn-info" id="btnAtenderModal"><i class="far fa-calendar-times"></i> Atender</button>
              -->
             <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>             
         </div>
    </div>
  </div>
</div>

<!-- ##### FIM MODALS ##### --> 
 
 
<script>
$(document).ready(function() {
	
    $( "#btnUsuarios" ).click(function() {
        $('#grupoUsuariosModal').modal();
    });    
      
    $('#usuariosSelect2').select2({
        placeholder: "Selecione o paciente",
        language: "pt-BR",        
        theme: "bootstrap",
        allowClear: true,
        minimumInputLength: 1,
        closeOnSelect: true,
        ajax: {
            url: 'api/listar-usuario-json',
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