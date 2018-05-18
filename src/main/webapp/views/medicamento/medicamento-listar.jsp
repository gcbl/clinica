<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>listar medicamentos [${MODEL}]</h1>
 
<!-- ########################################################################### -->
<hr>

        <div class="table-responsive table-sm">asdasd
            <table id="itemDataTable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Nome Generico</th>
                            <th>nomeFabrica</th>
                            <th>fabricante</th>
                            <th>concentracaoFormaFarmaceutica</th>
                            <th class="text-right"><a href="inserirMedicamento" class="btn btn-sm btn-success"><i class="fas fa-plus-circle"></i> Adicionar novo ${MODEL}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${medicamentos}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.nomeGenerico}</td>
                                <td>${item.nomeFabrica}</td>
                                <td>${item.fabricante}</td>
                                <td>${item.concentracaoFormaFarmaceutica}</td>
                                <td class="actions text-right">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                      <a href="visualizarMedicamento?id=${item.id}" class="btn btn-sm btn-info"><i class="fas fa-search"></i></a>
                                      <a href="editarMedicamento?id=${item.id}" class="btn btn-sm btn-warning"><i class="far fa-edit"></i></a>
                                      <a href="excluirMedicamento?id=${item.id}" class="btn btn-sm btn-danger"><i class="far fa-trash-alt"></i></a>
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
 
 
<script>
$(document).ready(function() {

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