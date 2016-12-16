/**
 * 
 */

$(function(){
	
	$('#mdBtn').click(function(){
		
		location.href="showUpdate.do?shNo=${show.shNo}";
	})
	
	$('#deBtn').click(function(){
		var result = confirm('정말 삭제하시겠습니까??');
		if (result){    //확인
			location.href="showDelete.do?shNo=${show.shNo}";
		}else{   //취소
		    return;
		}
		
		
	})
})