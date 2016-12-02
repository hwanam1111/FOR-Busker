

$(function () {
//	탭 바뀔시 코딩
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active2").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active2").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
    
    
//    버튼 form페이지 연결
    $("#moveToSponBtn").click(function(){
    	window.location.href="sponserForm.do";
    	
    })
//    버튼 form페이지 연결
    $("#moveToBackedBtn").click(function(){
    	window.location.href="backedForm.do";
    	
    })
});