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
            <h2 class="text-capitalize">Historico clinico ${MODEL}</h2>
 
<!-- ########################################################################### -->
<hr>
   

   <c:forEach var="historicoClinico" items="${historicoClinicoList}">
        <br>${historicoClinico.dataCriacao} : <b>${historicoClinico['class']} ***</b> : ${historicoClinico.paciente.nome} 
        <br>${historicoClinico.historicoClinico} 
        <br><br>
   </c:forEach>

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