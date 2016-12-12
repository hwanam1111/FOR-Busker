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
				console.log("에러발생 : "+param.toString());
			}
		});
	});
});