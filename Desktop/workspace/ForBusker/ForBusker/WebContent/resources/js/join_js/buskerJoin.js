$(function() {
	
	// 이메일 체크
	$('#buskerEmail').blur(function() {
		var reg_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if($('#buskerEmail').val().length>0){
			// 정규식 체크
			if(!reg_email.test($('#buskerEmail').val())){
				$('#emailCheck').text('이메일 형식이 맞지 않습니다');
				$('#emailCheck').css('color','red');
				$('#emailCheck').css('margin-top','5px');
				$('#emailCheck').css('margin-left','3px');
				$('#emailCheck').show();
			}else{
				$('#emailCheck').css('display', 'none');
			}
		} // ('#simpleEmail').val() end
	}); // ('#simpleEmail').blur end
	
	// ##################################################
	// ##################################################
	
	// 비밀번호 체크
	$('#buskerPasswordOk').blur(function() {
		if($('#buskerPassword').val() != $('#buskerPasswordOk').val()){
			$('#pwCheck').text('비밀번호가 일치하지 않습니다');
			$('#pwCheck').css('color','red');
			$('#pwCheck').css('margin-top','5px');
			$('#pwCheck').css('margin-left','3px');
			$('#pwCheck').show();
		}else{
			$('#pwCheck').hide();
		} // ($('#sign_password').val() != $('#sign_password_sub').val() end
	}); // ('#sign_password_sub').blur end
	
	// ##################################################
	// ##################################################
	
	// 이메일 인증
	$('#emailCheckBtn').click(function() {
		$('#confirm').show();
		
	});
	
});