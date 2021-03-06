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
                            <th>Permiss�es</th>
                            <th>Usu�rios</th>
                            <th class="text-right"><a href="incluir-${MODEL}" class="btn btn-sm btn-success"><i class="fas fa-plus-circle"></i> Adicionar novo ${MODEL}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td nowrap>${item.id}</td>
                                <td nowrap>${item.nome}</td>
                                <td nowrap>${item.descricao}</td>
                                <td>${fn:length(item.permissoes)} permiss�es</td>
                                <td>
                                    <ul>
                                        <c:forEach items="${item.usuarios}" var="itemList">
                                            <li>${itemList['class'].simpleName} ${itemList.nome} <small class="text-secondary">(login: ${itemList.login})</small></li>
                                        </c:forEach>
                                    </ul>
                                </td>
                                <td class="actions text-right">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                      <%--
                                      <a href="editar-${MODEL}-usuario?id=${item.id}" class="btn btn-sm btn-primary"><i class="fas fa-users"></i> Usu�rios</a>
                                      <a href="editar-${MODEL}?id=${item.id}" class="btn btn-sm btn-primary"><i class="far fa-edit"></i> Permiss�es</a>&nbsp;&nbsp;
                                      --%>
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