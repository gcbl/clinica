<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>Listar Medicos</h1>
 
<!-- ########################################################################### -->
<hr>
<div class="table-responsive table-sm">
    <table id="itemDataTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Nome</th>
                    <th>cpf</th>
                    <th>dataNascimento</th>
                    <th>Endereço</th>
                    <th>CRM</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${medicos}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.nome}</td>
                        <td>${item.cpf}</td>
                        <td>${item.dataNascimento}</td>
                        <td>${item.endereco}</td>
                        <td>${item.crm}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <!-- 
            <tfoot>
                <tr>
                    <th>id</th>
                    <th>Nome</th>
                    <th>Descricao</th>
                </tr>
            </tfoot>
             -->
    </table>
</div>            
<hr> 
<!-- ########################################################################### -->
        </div>
 
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
    
    
    $('#itemDataTable').Tabledit({
        url: 'medicos',
        columns: {
            identifier: [0, 'id'],
            editable: [[1, 'nome'], [2, 'cpf'], [3, 'dataNascimento'], [4, 'endereco'], [5, 'crm']]
        },
        buttons: {
            edit: {
                class: 'btn btn-sm btn-primary',
                html: '<i class="fas fa-edit"></i>',
                action: 'edit'
            },
            delete: {
                class: 'btn btn-sm btn-danger',
                html: '<i class="fas fa-trash-alt"></i>',
                action: 'delete'
            },
            confirm: {
                class: 'btn btn-sm btn-default',
                html: 'Confirma operação?'
            }
        },
        
        onDraw: function() {
            console.log('onDraw()');
        },  
        onSuccess: function(data, textStatus, jqXHR) {
            console.log('onSuccess(data, textStatus, jqXHR)');
            console.log(data);
            console.log(textStatus);
            console.log(jqXHR);
        },
        onFail: function(jqXHR, textStatus, errorThrown) {
            console.log('onFail(jqXHR, textStatus, errorThrown)');
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        },
        onAlways: function() {
            console.log('onAlways()');
        },
        onAjax: function(action, serialize) {
            console.log('onAjax(action, serialize)');
            console.log(action);
            console.log(serialize);
        }
        
    });
    

} );
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>