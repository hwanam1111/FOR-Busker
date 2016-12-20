$(function(){
	//일반인용 아이디 찾기 버튼이 눌렸을때
	$('#BuskersearchIdBtn').click(function(){
		
	   var memPhone=$('#buskerTel').val();
	   var memTeamName=$('#buskerTeamName').val();
		$.ajax({
			url:"buskerIdSearchByPhoneNum.do",
			type:"post",
			data: ({ memPhone : memPhone ,
					 memTeamName : memTeamName	
			}),
			dataType:"text",
			success:function(param){
				$('#teamTitle').text("해당 정보에 대한 이메일입니다.");
				$('#buskerTeamName').val(param.toString());
				$('#teamTel').hide();
				$('#buskerTel').hide();
				$('#BuskersearchIdBtn').hide();
			},
			error:function(param){
				$('#teamTel').text("입력한 정보가 틀리셨습니다. 다시 입력해주세요.");
				console.log("에러발생 : "+param.toString());
			}
		});
	});
	
	//로그인 화면으로
	$("#loginBtn").click(function(){
		location.href="login.do";
	});// 로그인 화면 끝
	
	
	//메인으로
	$("#mainBtn").click(function(){
		location.href="main.do";
	});//메인으로 끝
});