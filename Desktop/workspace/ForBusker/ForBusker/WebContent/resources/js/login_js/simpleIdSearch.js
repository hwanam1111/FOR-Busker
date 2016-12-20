$(function(){
	//일반인용 아이디 찾기 버튼이 눌렸을때
	$('#SimplesearchIdBtn').click(function(){
		
	   var memPhone=$('#simpleTel').val();
	   console.log("memPhone "+memPhone);
		$.ajax({
			url:"simpleIdSearchByPhoneNum.do",
			type:"post",
			data: { memPhone : memPhone },
			dataType:"text",
			success:function(param){
				console.log("찾아온 이메일: "+param.toString());
				$('#title').text(memPhone +" 에 대한 이메일 입니다.");
				$('#simpleTel').val(param.toString());
				$('#SimplesearchIdBtn').hide();
			},
			error:function(param){
				$('#title').text("입력한 정보가 틀리셨습니다. 다시 입력해주세요.");
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

