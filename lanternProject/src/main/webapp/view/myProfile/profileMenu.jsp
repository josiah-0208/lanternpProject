<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
			<div >
				<!-- Masthead Avatar Image-->
				<c:if test="${empty member.profile }">
				<img  src="assets/img/avataaars.svg" width="300" height="300">
				</c:if>
				<c:if test="${not empty member.profile }">
				<img  alt="프로필사진" src="/lanternProject/upload/${member.profile}" width="300" height="300">
				</c:if><br>
				<p >어서오세요 ${id }님</p>
			</div>
	</header>
<table>
	<tr><th><a href="../member/updateForm.do">회원정보 수정</a></th>
	<tr><th><a href="myBookmark.do">북마크한 축제</a></th>
	<tr><th><a href="myBoard.do">내가 쓴 게시글</a></th>
	<tr><th><a href="myReply.do">내가 쓴 댓글</a></th>
</table>
</body>
</html>