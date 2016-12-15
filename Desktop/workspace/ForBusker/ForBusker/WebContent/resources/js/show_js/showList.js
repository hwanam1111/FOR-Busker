$(function(){	

//#############################날짜 선택 및 카테고리 부분###################################
$('#exampleSelect2').hide();
//날짜 선택
var $input = $( '.datepicker' ).pickadate({
formatSubmit: 'yyyy/mm/dd',
// min: [2015, 7, 14],
container: '#container',
// editable: true,
closeOnSelect: true,
closeOnClear: true,    
	
});

$("#searchBtn").click(function(){

var now = new Date();
  var year  = now.getFullYear();
  var month = now.getMonth() + 1; // 0부터 시작하므로 1더함 더함
  var day   = now.getDate();
  if (("" + month).length == 1) { month = "0" + month; }
  if (("" + day).length   == 1) { day   = "0" + day;   }

  
var date = $("input[name=date_submit]").val(); //날짜값 저장
if(date=="null"){
	date=(year+'/'+month+'/'+day); //날짜값을 안넣고 그냥 submit할때 오늘날짜 넣어줌(placeholder에 오늘의 날짜라고 되어있기때문)
}

var select = $("#exampleSelect1 option:selected").val();

var inputvalue = $("[name=val]").val(); //select값과 value값들을 parameter로 같이 넘김
alert(date);
window.location.href="showListSearch.do?date="
                        + date
                        + "&select="
                        + select
                        + "&val="
                        + inputvalue;
               

});

/* Set the width of the side navigation to 250px */
$("#clickopen").click(function(){
document.getElementById("mySidenav").style.width = "250px";
}); 


/* Set the width of the side navigation to 0 */
function closeNav() {
document.getElementById("mySidenav").style.width = "0";
}


var picker = $input.pickadate('picker');

//카테고리 검색
$("#exampleSelect1").change(function(){//카테고리로 검색할경우 input을 text->select로 바꿔줌
if($("#exampleSelect1 option:selected").val() == "1"){
	$("#example-text-input").hide();
	$('#exampleSelect2').show();
	$('#example-text-input').attr("name","");
	$('#exampleSelect2').attr("name","val");
}else {
	$("#example-text-input").show();
	$('#exampleSelect2').hide();
	$('#exampleSelect2').attr("name","");
	$('#example-text-input').attr("name","val");
}
});
//##############################################################

});
//*******************js**********************
//###############슬라이더 열고 닫기################
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}

