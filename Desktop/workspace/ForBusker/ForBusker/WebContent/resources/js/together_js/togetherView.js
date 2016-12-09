$(function(){
	//수정 버튼이 눌렸을때
	$('.mdBtn').click(function(){
		var toNum=$(this).children().val();
		console.log("toNo"+toNum);
		 $('.ModifyBtn').attr("href", "togetherMod.do?toNo="+toNum);
		 console.log("컨트롤러 넘어감"+toNo);
	});
	//삭제 버튼이 눌렸을때
	$('.dlBtn').click(function(){
		var returnValue = confirm("정말 삭제하시겠습니까?");
		if(returnValue){
			//삭제 확인
			var toNo=$(this).children().val();
			 $('.deleteBtn').attr("href", "togetherDel.do?toNo="+toNo);
			 console.log("컨트롤러 넘어감");
			
		}else{
			//삭제 취소
		}
	});
	
});