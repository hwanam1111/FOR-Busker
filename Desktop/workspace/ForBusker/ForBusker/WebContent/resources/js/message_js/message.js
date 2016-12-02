/**
 * 
 */

$(function(){

	$("#popup").hide();
	
	$('.messageView').click(function() {
		event.preventDefault();
		$("#popup").bPopup();
	});

	function popupOpen(){
		var popUrl = "Pop.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		}
	//-->

});

