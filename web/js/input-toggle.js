$(document).ready(function(){
	disable();

	$("#editButton").click(function(){
		enable();
	});
});

function disable(){
	$(".form-group :input").prop("disabled", true);
}

function enable(){
	$(".form-group :input").prop("disabled", false);
}