<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../masterSessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<style type="text/css">
	@import url("../../css/master.css")
</style>
</head>
<body>
<div class="container_middle">
	<h1 class="title">관리자님 환영합니다</h1>
	<h3 style="position:relative; left: 350px; bottom: 50px;">
		<a href="/lanternProject/view/fest/festMain.so?tab=1">-메인으로</a>
	</h3>
	<p>
	<div class="main">
		<div class="mng">
			<a class="txt" href="masterFestival.do">	
				<img alt="" src="../../images/sky-lantern.png" width="300" height="300">축제정보 관리
			</a>
		</div>
		
		<div class="mng">
			<a class="txt" href="masterMember.do">
				<img id = "member_icon" alt="" src="../../images/team.png" width="300" height="300">회원 관리
			</a>
		</div>
		
		<div class="mng">
			<a class="txt" href="masterBoard.do">
				<img alt="" src="../../images/board.png" width="300" height="300">후기 게시판 관리
			</a>
		</div>
	</div>
</div>
</body>
</html>