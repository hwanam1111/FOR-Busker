$( document ).ready(function() {

	//view 삭제후 삭제 완료 or 실패 알림
		var result=$('.result').val();
		console.log("삭제 결과: "+result);
			if(result==1){
			alert('삭제 완료!');
			}else if(result==2){
				alert('삭제에 실패했습니다. 다시 시도해 주세요!');
			}else{}
	//검색 페이지로 이동
	$('#searchBtn').click(function(){
		var searchVal=$('#toSearch').val();
		$('#nextPage').attr("href","searchCofig.do?searchVal="+searchVal);
		console.log("controller로 이동"+searchVal);
	});		
	
});