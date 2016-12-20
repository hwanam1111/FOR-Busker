$( document ).ready(function() {
	
	var memEmail=$('#buskerEmail').val();  //입력한 이메일
	var buskerTel=$('#buskerTel').val(); //입력한 번호
	
	// 이메일 인증버튼을 눌렀을때
	$('#emailCheckBtn').click(function() {
		var memEmail=$('#buskerEmail').val();  //입력한 이메일
		var buskerTel=$('#buskerTel').val(); //입력한 번호
		$('#confirm1').show();
		
		console.log('인증 번호 눌림'+memEmail);
		
		$.ajax({
			url : 'gmail.do',
			type : 'get',
			data : ({memEmail : memEmail}),
			dataType : "text", 
			success : function (data) {
				console.log('인증번호가 전송되었습니다'+data.trim()+"/");
				authRandomNum = data.trim();	//이메일 인증할 때 메일로 받는 번호
				//authRandomNum = data;	
			},
			error:function(data){
				num=data.trim();
				console.log("에러발생 : "+num);
			}
		});

		$('#buskerEmail').attr('readonly', true);
		
		
	});
	//인증번호 확인
	$('#emailConfirm').blur(function() {
		console.log('블러확인');
		if($('#emailConfirm').val() == authRandomNum){ //입력한 인증번호와 받은 인증번호 일치 하는지 확인
			$('#emailConfirm').attr('readonly', true);
			$('#emailmessage').css('display', 'block')
			$('#emailmessage').text('인증 성공');
			$('#emailmessage').css('color','blue');
			$('#emailmessage').css('margin-top','5px');
			$('#emailmessage').css('margin-left','3px');
			$('#emailCheckBtn').attr('disabled', true);
		}else{
			if($('#emailConfirm').val().length>0){
				$('#emailmessage').css('display', 'block')
				$('#emailmessage').text('인증번호가 틀렸습니다');
				$('#emailmessage').css('color','red');
				$('#emailmessage').css('margin-top','5px');
				$('#emailmessage').css('margin-left','3px');
			}
		}


	}); //blur end
	
	//비밀번호 찾기
	$('#searchPwBtn').click(function(){
		var memEmail=$('#buskerEmail').val();  //입력한 이메일
		var memPhone=$('#buskerTel').val(); //입력한 번호
		$.ajax({
			url : 'searchPwConfig.do',
			type : 'post',
			data : ({
				memEmail : memEmail,
				memPhone : memPhone
			}),
			dataType : "text", 
			success : function (data) {
				$('#telTitle').text("해당 정보에 대한 비밀번호입니다.");
				$('#buskerTel').val(data.toString());//가져온 비밀번호 찍어주기
				$('#searchPwBtn').hide();
			},
			error:function(data){
				$("#telTitle").text("입력 한 정보가 잘못되셨습니다.");
				console.log("에러발생 : "+data.toString());
			}
			
		});
	});//비번찾기 끝
	
	//로그인 화면으로
	$("#loginBtn").click(function(){
		location.href="login.do";
	});// 로그인 화면 끝
	
	
	//메인으로
	$("#mainBtn").click(function(){
		location.href="main.do";
	});//메인으로 끝
	
});