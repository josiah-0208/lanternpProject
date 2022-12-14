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
<link rel="stylesheet" href="../../css/mamem.css">

<style>
/* common CSS */
select {
	border: none;
    width: 80px;
    height: 40px;
    border-bottom: 1px solid #000;
}

input {
	width: 170px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #000;
}

</style>
<script type="text/javascript">
	function del(delmember_no) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../member/delete.do?member_no="+delmember_no;
		}
	}
	
	$(document).ready(function() {
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
	
	function chk(){
		if(!frm.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<section class="container_wide">
<!-- 	<div class="top">
		<div class="searchForm">
			<form action="adminFindMember.na" name="frm" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="id" >아이디</option>
					<option value="name">이름</option>
					<option value="nick_nm">별명</option>
				</select>
				<input type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
		<div class="btn_box">
			<a class="btn btn_stroke" href="/semojeon/views/member/joinForm.na">등록</a>	
		</div> 
	</div> -->

	<div class="container-table">
		<table>
			<tr>
				<th>회원번호</th><th>Id</th><th>비밀번호</th><th>이름</th><th>연락처</th><th>이메일</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="11">회원 데이터가 존재하지 않습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.member_no}</td>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.phone}</td>
						<td>${member.email}</td>
						<td>${member.reg_date}</td>
						<td>${member.profile}</td>
						<td>${member.del}</td>
						<td><a href="../member/updateForm.do?member_no=${member.member_no}" class="btn btn_small">수정</a></td>
						<td><a onclick="del(${member.member_no})" class="btn btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
	</div>
<!-- paging -->
	<div class="paging nums">
		<div class="items" align="center">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='masterMember.do?pageNum=${startPage-1}'">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='masterMember.do?pageNum=${currentPage - 1}'">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
					</button>
				</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='masterMember.do?pageNum=${i}'">${i}</span>
			</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='masterMember.do?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class="last" onclick="location.href='masterMember.do?pageNum=${endPage + 1}'">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
					</button> 
				</c:if>
		</div> <!-- number -->
	</div> <!-- paging -->	
</section>