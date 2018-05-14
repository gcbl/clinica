<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>Listar Pacientes</h1>
 
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
                    <th>planoSaude</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pacientes}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.nome}</td>
                        <td>${item.cpf}</td>
                        <td>${item.dataNascimento}</td>
                        <td>${item.endereco}</td>
                        <td>${item.planoSaude}</td>
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

} );
</script> 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>