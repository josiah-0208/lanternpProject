<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/profileMenu.css?1");</style>
<style type="text/css">@import url("/lanternProject/css/common.css?2");</style>
	<div class="container">
	<div></div><div></div>
		<div class="profile">
			<!-- Masthead Avatar Image-->
			<c:if test="${empty member.profile }">
			<img  src="assets/img/avataaars.svg" width="300" height="300">
			</c:if>
			<c:if test="${not empty member.profile }">
			<img  alt="프로필사진" src="/lanternProject/upload/${member.profile}" width="300" height="300">
			</c:if><br>
			<p>안녕하세요 ${id }님!</p>
		</div>&nbsp;

		<div class="profile_menu"><br>
			<div>
				<a href="../member/updateForm.do">
					<img alt="" src="/lanternProject/images/icons/edit_white.png" width="40px" height="40px">
					&nbsp;&nbsp;&nbsp;회원정보 수정
				</a>
			</div><br>
			<div>
				<a href="myBookmark.do">
					<img alt="" src="/lanternProject/images/icons/bm2.png" width="40px" height="40px">
					&nbsp;&nbsp;&nbsp;북마크한 축제
				</a>
			</div><br>
			<div>
				<a href="myBoard.do">
					<img alt="img" src="/lanternProject/images/icons/board_white.png" width="40px" height="40px">
					&nbsp;&nbsp;&nbsp;내가 쓴 게시글
				</a>
			</div><br>
			<div>
				<a href="myReply.do">
					<img alt="" src="/lanternProject/images/icons/reply_white1.png" width="40px" height="40px">
					&nbsp;&nbsp;&nbsp;내가 쓴 댓글
				</a>
			</div>
		</div>
		<div></div><div></div>
	</div>
