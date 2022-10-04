<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/lanternProject/css/header.css?f">
<script type="text/javascript">
	// nav active control
	$(document).ready(function() { // window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/"); // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl[5]).addClass("active");
		if (sliceUrl[6] === 'loginForm.do' || sliceUrl[6] === 'joinForm.do') {
			$('.nav_top').hide();
		}
		
	});
	
	function ssChk(name) {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			if (con) {
				location.href="/lanternProject/view/member/loginForm.do";
			}
			} else {
				location.href="/lanternProject/view/myProfile/myProfileMain.do";
			}
		};
</script>
</head>
<body>   
	<header>
		<div class='header'>
			<div class='header_logo'>
				<div class="icon1" onclick="location.href='/lanternProject/view/fest/festMain.so?tab=1'">
					<img src="/lanternProject/images/lantern.png" style="width:100%; height:100%;">
				</div> 
			</div>
			<div class='nav'>
				<div class='nav_top'>
					<c:if test="${empty id }">
						<div><a href="/lanternProject/view/member/loginForm.do">로그인</a></div>
						<div><a href="/lanternProject/view/member/joinForm.do">회원가입</a></div>
					</c:if>
					<c:if test="${not empty id }">
						<c:if test="${id != 'master'}">
							<div class="g13"><a href="/lanternProject/view/member/logout.do">로그아웃</a></div>
						</c:if>
						<c:if test="${id == 'master'}">
							<div class="g12"><a href="/lanternProject/view/member/logout.do">로그아웃</a></div>
							<div class="g12"><a href="/lanternProject/view/master/masterMain.do">관리자페이지</a></div>
						</c:if>
					</c:if>
				</div>
				<div class='nav_bottom'>
					<div><a href="/lanternProject/view/fest/festMain.so?tab=1" id="fest">축제</a></div>
					<div><a href="/lanternProject/view/board/boardList.en" id="board">리뷰</a></div>
					<div><a id="myProfile" onclick="return ssChk('main')">마이페이지</a></div>
				</div>
			</div>
		</div>
	</header>

</body>

</html>