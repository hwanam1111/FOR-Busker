$(function(){
	//공연 분류 기타를 눌렀을때
	$('#togetherRegistEtc').hide();
	$("#selectperForm").change(function(){
		if($("#selectperForm option:selected").val() == "기타"){
			$('#togetherRegistEtc').show();
			$('#selectperForm').attr("name","");
			$('#togetherRegistEtc').attr("name","toNeed");
		}else{
			$('#togetherRegistEtc').hide();
			$('#togetherRegistEtc').attr("name","");
			$('#selectperForm').attr("name","toNeed");
		}
	}); 
	
});