<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>Listar Medicos</h1>
 
<!-- ########################################################################### -->
<!-- 
    private String nome;
    private String cpf;
    private Date dataNascimento;
    private String endereco;
    private String bairro;    
    private String cep;
    private String cidade;
    private String estado;

 -->
<hr>
<div class="table-responsive table-sm">
<form:form action="medicos" commandName="medico">
    <table id="itemDataTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>id</th>
                    <th>CRM</th>
                    <th>Nome</th>
                    <th>cpf</th>
                    <th>dataNascimento</th>
                    <th>Endereço</th>
                    <th>Bairro</th>
                    <th>cep</th>
                    <th>cidade</th>
                    <th>estado</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${medicos}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.crm}</td>
                        <td>${item.nome}</td>
                        <td>${item.cpf} <form:errors path="cpf" cssClass="text-danger" /></td>
                        <td> <%-- <tags:localDate date="${yourDateToPrint}" pattern="dd/MM/yyyy"/> --%> <fmt:formatDate pattern="dd/MM/yyyy" value="${item.dataNascimento}" /></td>
                        <td>${item.endereco}</td>
                        <td>${item.bairro}</td>
                        <td>${item.cep}</td>
                        <td>${item.cidade}</td>
                        <td>${item.estado}</td>
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
</form:form>    
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
        restoreButton: false,
        columns: {
            identifier: [0, 'id'],
            editable: [[1, 'crm'], [2, 'nome'], [3, 'cpf'], [4, 'dataNascimento'], [5, 'endereco'], [6, 'bairro'],[7, 'cep'],[8, 'cidade'],[9, 'estado'], ]
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