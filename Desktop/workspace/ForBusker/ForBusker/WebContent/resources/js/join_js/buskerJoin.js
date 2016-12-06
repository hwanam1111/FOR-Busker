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
				$.ajax({
					url : 'idchecked.do',
					type : 'get',
					data : ({ userid : $('[name=memEmail]').val() }),
					dataType : "text", // html / xml / json / jsonp / text
					success : function (data) {
						if($('#buskerEmail').val().length>6){
							if(jQuery.trim(data) == 'YES') {
								$('#emailCheck1').text('이미 사용중인 아이디 입니다');
								$('#emailCheck1').css('color','red');
								$('#emailCheck1').css('margin-top','5px');
								$('#emailCheck1').css('margin-left','3px');
								$('#emailCheck1').css('display', 'block')
							}else{
								$('#emailCheck1').text('사용가능한 아이디 입니다');
								$('#emailCheck1').css('color','blue');
								$('#emailCheck1').css('margin-top','5px');
								$('#emailCheck1').css('margin-left','3px');
								$('#emailCheck1').show();
								$('#emailCheckBtn').attr('disabled', false);
							}
						}else{
							$('#idmessage').css('display','none');
						}
					}, // success end
					error : function() {
						alert("에러발생");
					} // error end
				}); // ajax end
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
	
	var authRandomNum;

	$('#emailCheckBtn').click(function() {
		$('#confirm').show();
		var email = $('#buskerEmail').val();
//		location.href='Gmail.jsp?mEmail='+email;
//		$('#email_ok').attr('disabled', true);
		$.ajax({
//			url : 'Gmail.jsp?mEmail='+email ,
//			url : '/test/polarBView/p_main/Gmail.jsp',
			url : 'gmail.do',
			type : 'get',
			data : ({memEmail : email}),
			dataType : "text", // html / xml / json / jsonp / text
			success : function (data) {
				authRandomNum = data.trim();	
				alert('인증번호가 전송되었습니다');
			}
		});

		$('#buskerEmail').attr('readonly', true);
		
	});
	
	$('#buskerConfirm').blur(function() {
		if($('#buskerConfirm').val() == authRandomNum){
			$('#buskerConfirm').attr('readonly', true);
			$('#emailmessage').css('display','none');
			$('#emailCheckBtn').attr('disabled', true);
		}else{
			if($('#buskerConfirm').val().length>0){
				$('#emailmessage').css('display', 'block')
				$('#emailmessage').text('인증번호가 틀렸습니다');
				$('#emailmessage').css('color','red');
				$('#emailmessage').css('margin-top','5px');
				$('#emailmessage').css('margin-left','3px');
			}
		}


	}); //blur end
	
	
	
//	정규식 유효성 체크
//	#######################
	$('#submitBtn').click(function(){
		var reg_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if($('#buskerEmail').val().length<1){
			alert('이메일을 입력하세요');
			$('#buskerEmail').focus();
			return false;
		} 

		if(!reg_email.test($('#buskerEmail').val())){ 
			alert('이메일 주소가 유효하지 않습니다'); 
			return false;
		}
		
		if($('#emailCheck1').css('color')=='rgb(255, 0, 0)'){
			alert('중복된 이메일 입니다');
			return false;
		}
		
		if($('#buskerPassword').val().length<1){
			alert('비밀번호를 입력하세요');
			return false;
		}
		if($('#buskerPasswordOk').val().length<1){
			alert('비밀번호를 입력하세요');
			return false;
		}
		if($('#buskerPassword').val() != $('#buskerPasswordOk').val()){
			alert('비밀번호가 일치하지 않습니다');
			return false;
		}
		if($('#buskerTel').val().length<1){
			alert('핸드폰 번호를 입력하세요');
			return false;
		}
		if(!regExp.test($('#buskerTel').val())){ 
			alert('핸드폰 번호 형식이 맞지 않습니다'); 
			return false;
		}
		if($('#buskerTeamName').val().length<1){
			alert('팀명을 입력하세요');
			return false;
		}
		if($("input:checkbox[name='memTeamType']").is(":checked") == false){
			alert('공연 장르를 선택하세요');
			return false
		}
		if($('#buskerVideo').val().length<1){
			alert('홍보영상 url을 입력하세요');
			return false;
		}
		if($('#buskerDetail').val().length<1){
			alert('팀 설명을 입력하세요');
			return false;
		}
		

		if($('#buskerConfirm').val() != authRandomNum){
			alert('이메일 인증을 해주세요');
			return false;
		}



		$('#buskerJoinForm').attr("action","joinOk.do");
		$('#buskerJoinForm').attr("method","post");
		$('#buskerJoinForm').attr("enctype","multipart/form-data");
		$('#buskerJoinForm').submit();
	});
	
});