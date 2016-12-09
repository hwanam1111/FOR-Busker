

$(function () {


    

	
    $("ul.tabs li").each(function(){
      	$(this).click(function (evt) {

            var activeTab = $(this).attr("rel");
            
            if( activeTab == 'tab1') window.location.href="sponAndBacked.do?cate=spon&page=1";
            else window.location.href="backedList.do?cate=backed&page=1";
        });
    })
    

    
//    버튼 form페이지 연결
    $("#moveToSponBtn").click(function(){
    	window.location.href="sponserForm.do";
    	
    })
//    버튼 form페이지 연결
    $("#moveToBackedBtn").click(function(){
    	window.location.href="backedForm.do";
    	
    })
});