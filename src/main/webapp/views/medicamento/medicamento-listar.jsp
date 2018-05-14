<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>listar medicamentos</h1>
 
<!-- ########################################################################### -->
<hr>
<div class="table-responsive table-sm">
    <table id="itemDataTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Nome Generico</th>
                    <th>nomeFabrica</th>
                    <th>fabricante</th>
                    <th>concentracaoFormaFarmaceutica</th>
                    <th>Ação</th>
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
                        <td>
                         <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">edit</i></a>
                         <a href="#deleteItemModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">delete</i></a>
                         ***
                         <a href="alterar/${item.id}">alterar</a> | <a href="excluir/${item.id}">excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th>id</th>
                    <th>nomeGenerico</th>
                    <th>nomeFabrica</th>
                    <th>fabricante</th>
                    <th>concentracaoFormaFarmaceutica</th>
                </tr>
            </tfoot>
    </table>
</div>            
<hr> 
<!-- ########################################################################### -->
        </div>
 
<!-- ##### MODALS ##### -->

<!-- Delete Modal HTML -->
    <div id="deleteItemModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">                      
                        <h4 class="modal-title">Delete ${medicamentos[0]['class'].simpleName} </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">                    
                        <p>Are you sure you want to delete these Records?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- ##### FIM MODALS ##### --> 
 
 
<script>
$(document).ready(function() {

	var table = $('#itemDataTable').DataTable( {
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