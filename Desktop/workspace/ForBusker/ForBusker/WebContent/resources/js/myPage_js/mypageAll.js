$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        
        if(activeTab=='#SponserList')window.location.href="mypageSponserList.do?cate=sponser&page=1";
        else if(activeTab=='#BackedList')window.location.href="mypageBackedList.do?cate=backed&page=1";
        else if(activeTab=='#VideoList')window.location.href="mypageVideoList.do?cate=video&page=1";
        else if(activeTab=='#JoinList') window.location.href="mypageTogetherList.do?cate=toList&page=1";
        else window.location.href="mypageAll.do?cate=show&page=1";

		
        
        
	});

	
});