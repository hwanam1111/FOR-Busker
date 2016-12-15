$(function(){
	
	//상세보기 누르면 해당 좌표값 받아오기
	$('.detail').click(function(){
		$('#loc').val($(this).next().val());
		var shNo=$(this).children().val();
		$.ajax({
			url:"selectShowByNum.do",
			type:"post",
			data:({
				shNo:shNo
			}),
			dataType:"text",
			success:function(param){
				//넘어온 json형 받기
				var data=eval("("+param+")");
				//console.log(data.shTeamName);
				$('#teamName').text("팀 이름 : "+data.shTeamName);
				$('#shVideo').text("팀 홍보영상 : "+data.shVideo);
				$('#shName').text("제목 : "+data.shName);
				$('#shMapCoords').text("위치"+data.shMapCoords);
				$('#shMapAddr').text("주소: "+data.shMapAddr);
				$('#shMapDetail').text("상세주소 : "+data.shMapDetail);
				$('#shTime').text("시간 : "+data.shTime);
				$('#shDate').text("날짜: "+data.shDate);
				$('#shType').text("타입 : "+data.shType);
				$('#shDetail').text("상세정보 : "+data.shDetail);
	            
			},
			error:function(param){
				console.log("에러발생");
			}
		});
		
		//슬라이드 나오는부분
		$('#mySidenav').css("width","750px");
		$('#mySidenav').css("margin-top","75px");
		$('#main').css("margin-left","250px");

	});
	
	//#############지도 확대 축소###############
	$('#plus').click(function(){
		//console.log("zoomin");
	    map.setLevel(map.getLevel() - 1);
	});

	$('#minus').click(function(){
		 map.setLevel(map.getLevel() + 1);
	});
	
	
});


