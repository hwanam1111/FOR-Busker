$(function(){
	//공연 분류 기타를 눌렀을때
	$('#togetherRegistEtc').hide();
	$("#selectperForm").change(function(){
		if($("#selectperForm option:selected").val() == "4"){
			$('#togetherRegistEtc').show();
			$('#selectperForm').attr("name","");
			$('#togetherRegistEtc').attr("name","shType");
		}else{
			$('#togetherRegistEtc').hide();
			$('#togetherRegistEtc').attr("name","");
			$('#selectperForm').attr("name","shType");
		}
	}); 
	
});