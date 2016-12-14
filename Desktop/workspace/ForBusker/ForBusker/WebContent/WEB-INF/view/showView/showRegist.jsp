<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="busker.scan.vo.MemberVO"%>
<%
	String projectName = "/ForBusker";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Bootstrap 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- include header -->
<link href="<%=projectName%>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<!--  달력,시간 api 가져오기 -->
<link rel="stylesheet" type="text/css" href="<%=projectName%>/resources/css/show_css/jquery.datetimepicker.css" />
<!--  performanceRegist.css 끌어오기 -->
<link rel="stylesheet" href="<%=projectName%>/resources/css/show_css/performanceRegist.css"/>
<script src="<%=projectName%>/resources/js/show_js/jquery.datetimepicker.full.js"></script>
<!--  Daum Map api 가져오기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script	src="//apis.daum.net/maps/maps3.js?apikey=5108c86decdbe007d7eeb3cee1dfce12&libraries=services"></script>
<script   src="//apis.daum.net/maps/maps3.js?apikey=5108c86decdbe007d7eeb3cee1dfce12&libraries=services"></script>

 <script type="text/javascript"> 
$(function(){
	$('.some_class').datetimepicker(	
	);
	
	 $('#ShowRegistGenreEtcInput').hide();
	$("#ShowRegistGenreInput").change(function(){
		if($("#ShowRegistGenreInput option:selected").val() == "5"){
			$('#ShowRegistGenreEtcInput').show();
			$('#ShowRegistGenreInput').attr("name","");
			$('#ShowRegistGenreEtcInput').attr("name","shType");
		}else{
			$('#ShowRegistGenreEtcInput').hide();
			$('#ShowRegistGenreEtcInput').attr("name","");
			$('#ShowRegistGenreInput').attr("name","shType");
		}
	}); 
	<% MemberVO ok=(MemberVO)session.getAttribute("login");%>
	$("#ShowRegistMemEmail").val("<%=ok.getMemEmail()%>");
	
});
</script>
 
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


	<!-- 이부분 부터 코딩 시작 -->
	<div class="hoc">
		<form id="form1" runat="server" method='post' style="margin-left:140px;" action="ShowRegistCompleteForm.do">
			<table>
				<!-- 어떤 입력폼인가 -->
				<tr>
					<h1>performanceRegist Form</h1>
					<br />
					<br />
				</tr>

				<!-- 제목 -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">제목</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" placeholder="제목을 입력하세요" id="ShowRegistTitleInput" name="shName">
						</div>
					</div>
				</tr>
				<!-- 영상URL -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">영상 URL</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" placeholder="홍보 영상을 업로드하세요" id="ShowRegistVideoInput" name="shVideo">
							<a href="showRegistUploadInfo.do">영상등록하는방법확인</a> &nbsp;&nbsp;
						</div>
					</div>
				</tr>
				<!-- 지도 -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">지도</label>
					<div class="col-xs-6">
						<input class="form-control" type="text" id="ShowRegistAddrInput" name="shMapAddr" placeholder="주소검색을 눌러주세요." style="background-color: #fff;" readonly/>
					
					<div id="map"style="width: 100%; height: 300px; margin-top: 10px; float:right; display: none"></div>
					
					<!--  주소 검색시 div(map)에 지도 생성  -->
								<script type="text/javascript">
				  
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				            level: 2 // 지도의 확대 레벨
				    };
				
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(37.537187, 127.005476),
				        map: map
				    });
				    function sample5_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = data.address; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				
				                // 기본 주소가 도로명 타입일때 조합한다.
				                if(data.addressType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("ShowRegistAddrInput").value = fullAddr;
				                // 주소로 좌표를 검색
				                geocoder.addr2coord(data.address, function(status, result) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				                        // 지도를 보여준다.
				                        document.getElementById("ShowRegistAddrCoords").value= coords;
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                        alert(coords);
				                    }
				                });
				            }
				        }).open();
				        }
				   </script>
					
					</div>
				<div class="col-xs-2">
					<button type="button" id="addressSearch" class="btn btn-info" onclick="sample5_execDaumPostcode()" style="width:100px;">주소 검색</button>
				    </div>
				</div>
				</tr>
			
				<!-- 위치설명 -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">위치설명</label>
						<div class="col-xs-8">
					   <textarea class="form-control" id="ShowRegistLocDetailInput" name="shMapDetail" rows="2" placeholder="위치에 대한 설명을 해주세요."></textarea>
					</div>
				</tr>
				<!-- 시간선정 -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">시간선정</label>
						<div class="col-xs-4">
							<input type="text" class="some_class form-control" placeholder="시간을 정해주세요 " id="ShowRegistTimeInput" name="shDateTime" />
							
						</div>

					</div>
				</tr>
				<!-- 담당자명 -->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">공연자(팀 이름)</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" placeholder="공연자 이름(팀 이름)을 입력하세요" id="ShowRegistPerformerInput" name="shTeamName">
						</div>
					</div>
				</tr>
				<!-- 공연분류-->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">공연분류</label>
						<div class="col-xs-8">
							<select class="form-control" id="ShowRegistGenreInput" name="shType">
								<option value=''>선택하세요</option>
								<option value='노래'>노래</option>
								<option value='댄스'>댄스</option>
								<option value='연주'>연주</option>
								<option value='마술'>마술</option>
								<option value='퍼포먼스'>퍼포먼스</option>
								<option value='기타'>기타</option>
							</select>
							<input class="form-control" type="text" placeholder="공연분류(기타)를 입력하세요" id="ShowRegistGenreEtcInput" name="shType" style="margin-top:15px;">
							</div>
					</div>
				</tr>
				<!-- 상세설명-->
				<tr>
					<div class="form-group row">
						<label for="example-text-input" class="col-xs-2 col-form-label">상세설명</label>
						<div class="col-xs-8">
					   <textarea class="form-control" id="ShowRegistShowDetail" rows="5" name="shDetail"
    					placeholder="공연에 대한 설명을 해주세요."></textarea>
						</div>
					</div>
				</tr>
				<tr>
					<div align="center">
						<button type="submit" class="btn btn-info">등록하기</button>
					</div>
				</tr>
			</table>
				<input type="hidden" id="ShowRegistAddrCoords" name="shMapCoords" value="" />
				<input type="hidden" id="ShowRegistMemEmail" name="memEmail" value=""/>
		</form>
	</div>



	<!-- 코딩 종료 -->


	<!-- ##############  footer 부분 include  ############## -->
	<jsp:include page="/WEB-INF/view/includeFile/footer.jsp" />
	<!-- ################################################## -->
	<!-- #############  반응형 모바일 js  ############# -->
	<script
		src="<%=projectName%>/resources/js/index_js/jquery.mobilemenu.js"></script>
	<!-- ################################################### -->
</body>
</html>