/**
 * 
 */

$(function(){
	$("#sponSubmit").click(function(){
		
		
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		
		if($('input[name=spName]').val().length<1){
			alert('제목을 입력하세요');
			return false;
		}else if($('textarea[name=spContent]').val().length<1){
			alert('내용을 입력하세요');
			return false;
		}else if($('textarea[name=spCond]').val().length<1){
			alert('조건을 입력하세요');
			return false;
		}else if($('input[name=spTel]').val().length<1){
			alert('핸드폰 번호를 입력하세요');
			return false;
		}
		
		if(!regExp.test($('input[name=spTel]').val())){ 
			alert('핸드폰 번호 형식이 맞지 않습니다'); 
			return false;
		}
		
		
		$('#sponserForm').attr("action","sponInsert.do");
		$('#sponserForm').attr("method","post");
		$('#sponserForm').attr("enctype","multipart/form-data");
		$('#sponserForm').submit();
	});
})
	