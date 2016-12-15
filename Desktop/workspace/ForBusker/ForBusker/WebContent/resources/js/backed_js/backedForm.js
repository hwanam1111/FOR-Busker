/**
 * 
 */

$(function(){
	
	$('#backedSubmit').click(function(){
		
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	    var reg_url = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w_\.-]*)*\/?$/;
	    
		if($('input[name=backName]').val().length<1){
			alert('제목을 입력하세요');
			return false;
		}else if($('input[name=backVideo]').val().length<1){
			alert('동영상URL을 입력하세요');
			return false;
		}else if($('textarea[name=backContent]').val().length<1){
			alert('내용을 입력하세요');
			return false;
		}else if($('input[name=backTel]').val().length<1){
			alert('핸드폰 번호를 입력하세요');
			return false;
		}
		
		if(!regExp.test($('input[name=backTel]').val())){ 
			alert('핸드폰 번호 형식이 맞지 않습니다'); 
			return false;
		}else if(!reg_url.test($("input[name=backVideo]").val())){
	         alert("영상주소 형식을 URL형식으로 맞춰주세요");
		}
		
		$('#backedForm').attr("action","backedInsert.do");
		$('#backedForm').submit();
		
	})
	
})