

$(function () {
//	탭 바뀔시 코딩
//    $(".tab_content").hide();
//    $(".tab_content:first").show();

    

	
    $("ul.tabs li").each(function(){
      	$(this).click(function (evt) {
      		
//    		$("ul.tabs li").removeClass("kkk").css("color", "#333");
//          $(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
//          $(this).addClass("kkk").css("color", "darkred");
            //$(".tab_content").hide()
            var activeTab = $(this).attr("rel");
            //$("#" + activeTab).fadeIn()
            //이곳에다가 작성하기 후원해주세요 눌렀을때 페이지 -> 눌렀을때 PageVO에 curPage를 1로 바꾸기
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
    
    //버튼: sponSearch페이지 연결
    $("#sponSearchBtn").click(function(){
    	
    	var search = $("#example-text-input1").val();
    	
        window.location.href="sponSearch.do?search="+search;
    }) 
    
    
    //버튼 : backedSearch페이지로 연결
    $("#backedSearchBtn").click(function(){
    	
    	var search = $("#example-text-input2").val();
    	
        window.location.href="backedSearch.do?search="+search;
    })    	
});

