$(function() {
	$("#popup").hide();
	
	$('#popupImg').click(function() {
		event.preventDefault();
		$("#popup").bPopup();
	});
});