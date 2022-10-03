<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1 class="title">축제 정보 관리</h1>
	<div class="main">
		<div class="mng">
			<a class="txt" href="../fest/festRegistForm.so">
				<img alt="" src="../../images/add.png" width="300" height="300">축제정보 등록
			</a>
		</div>
		
		<div class="mng">
			<a class="txt" href="festList.do">
				<img id = "member_icon" alt="" src="../../images/document.png" width="300" height="300">축제정보 수정/삭제
			</a>
		</div>
	</div>
</div>
</body>
</html>