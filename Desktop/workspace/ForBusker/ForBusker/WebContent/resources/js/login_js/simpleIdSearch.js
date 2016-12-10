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
				console.log("에러발생 : "+param.responseText);
				console.log("에러발생 : "+param.toString());
			}
		});
	});
});