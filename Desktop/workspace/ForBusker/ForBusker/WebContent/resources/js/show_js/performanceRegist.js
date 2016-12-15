/**
 * 
 */

$(function(){
	$('.some_class').datetimepicker(	
	);
	
	 $('#ShowRegistGenreEtcInput').hide();
	$("#ShowRegistGenreInput").change(function(){
		if($("#ShowRegistGenreInput option:selected").val() == "기타"){
			$('#ShowRegistGenreEtcInput').show();
			$('#ShowRegistGenreInput').attr("name","");
			$('#ShowRegistGenreEtcInput').attr("name","shType");
		}else{
			$('#ShowRegistGenreEtcInput').hide();
			$('#ShowRegistGenreEtcInput').attr("name","");
			$('#ShowRegistGenreInput').attr("name","shType");
		}
	}); 
	
	$("#submitbtn").click(function(){
		var reg_url = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w_\.-]*)*\/?$/;
		if($("#ShowRegistTitleInput").val().length<1){
			alert("제목을 입력하세요");
		}else if($("#ShowRegistVideoInput").val().length<1){
			alert("영상주소를 입력하세요");
		}else if(!reg_url.test($("#ShowRegistVideoInput").val())){
			alert("영상주소 형식을 URL형식으로 맞춰주세요");
		}else if($("#ShowRegistAddrInput").val().length<1){
			alert("위치를 입력하세요");
		}else if($("#ShowRegistTimeInput").val().length<1){
			alert("시간를 입력하세요");
		}else if($("#ShowRegistPerformerInput").val().length<1){
			alert("팀이름을 입력하세요");
		}
		else if($("[name='shType']").val().length<1){
			alert("공연분류를 입력하세요");
		}	
		else{
			$("#form1").submit();
		}
		
		
	});
});
