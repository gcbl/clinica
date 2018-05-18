
$(document).ready(function(){
	
	
	

});



$("#exampleModal").on("show.bs.modal", function (event) {
	alert("show.bs.modal");
});


// --------------------------------------------------------------------


$("#exampleModal").on("shown.bs.modal", function (event) {
	alert("shown.bs.modal");
});

$("#exampleModal").on("hide.bs.modal", function (event) {
	alert("hide.bs.modal");
});

$("#exampleModal").on("hidden.bs.modal", function (event) {
	alert("hidden.bs.modal");
});




//$("#delete-modal").on("show.bs.modal", function (event) {
//	alert("2");
//  var button = $(event.relatedTarget);
//  alert("3");
//  var id = button.data("customer");
//  alert("4");
//  
//  var modal = $(this);
//  alert("5");
//  modal.find(".modal-title").text("Excluir Cliente #" + id);
//  alert("6");
//  
//  modal.find("#confirm").attr("href", "delete.php?id=" + id);
//  alert("7");
//})