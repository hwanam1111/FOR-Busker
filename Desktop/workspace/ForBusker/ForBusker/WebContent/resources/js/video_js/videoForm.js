
$(function() {
	$("#videoBtn").click(function() {
		if($("#videoName").val().length<1){
			alert("제목을 입력하세요");
			return false;
		}
		if($("#videoUrl").val().length<1){
			alert("영상 URL을 입력하세요");
			return false;
		}
		if($("#videoDetail").val().length<1){
			alert("설명을 입력하세요");
			return false;
		}
		if($("#hiddenTeamName").val().length<1){
			alert("공연자 회원만 글 등록이 가능합니다.");
			location.href="videoMain.do";
			return false;
		}
		
		$('#videoForm').attr("action","videoFormOk.do");
		$('#videoForm').submit();
	});
})