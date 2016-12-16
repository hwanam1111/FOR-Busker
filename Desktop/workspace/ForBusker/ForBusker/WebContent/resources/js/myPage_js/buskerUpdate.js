/**
 * 
 */

$(function(){
	$('#updatePasswordOk').blur(function() {
		if($('#updateSimplePassword').val() != $('#updateSimplePasswordOk').val()){
			$('#pwCheck').text('비밀번호가 일치하지 않습니다');
			$('#pwCheck').css('color','red');
			$('#pwCheck').css('margin-top','5px');
			$('#pwCheck').css('margin-left','3px');
			$('#pwCheck').show();
		}else{
			$('#pwCheck').hide();
		} // ($('#sign_password').val() != $('#sign_password_sub').val() end
	});
	
	$('#updateForm').attr("method","post");
	$('#updateForm').attr("enctype","multipart/form-data");

});

