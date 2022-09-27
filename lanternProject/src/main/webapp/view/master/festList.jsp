<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../masterSessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("../../css/mamem.css");
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
	function del(delfno) {
		var con = confirm("해당 축제정보를 삭제 하시겠습니까?");
		if(con) {
			location.href="../fest/festDelete.so?fno="+delfno;
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
	<!-- <div class="top">
		<div class="searchForm">
			<form action="adminFindBoard.na" name="frm" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="title" >제목</option>
					<option value="nick_nm">작성자</option>
				</select>
				<input type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
		<div class="btn_box">
			<a class="btn btn_stroke" href="/semojeon/views/board/boardWriteForm.wo">등록</a>	
		</div>
	</div> -->	
	<div class="container-table">
		<table>
			<tr>
				<th>축제번호</th><th>축제이름</th><th>기간</th><th>개장시간</th><th>주최</th><th>지역</th><th>주소</th><th>장소</th><th>홈페이지</th><th>전화</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="13">데이터가 존재하지 않습니다</th></tr>
			</c:if>
				
			<c:if test="${not empty list }">
				<c:forEach var="fest" items="${list }">
					<tr>
						<td>${fest.fno} </td>
						<td>${fest.fname} </td>
						<td>${fest.start_date}~${fest.end_date } </td>
						<td>${fest.hours} </td>
						<td>${fest.host} </td>
						<td>${fest.loc} </td>
						<td>${fest.addr} </td>
						<td>${fest.spot} </td>
						<td><a href="${fest.home_pg}">${fest.home_pg}</a></td>
						<td>${fest.tel} </td>
						<td>${fest.del} </td>
						<td><a href="../fest/festUpdateForm.so?fno=${fest.fno}" class="btn btn_stroke btn_small">수정</a></td>
						<td><a onclick="del(${fest.fno})" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>		
		</table>
	</div>
	<!-- paging -->
	<div class="paging nums" align="center">
		<div class="items">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='masterBoard.do?pageNum=${startPage-1}'">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='masterBoard.do?pageNum=${currentPage - 1}'">
						<img alt="이전" src="../../images/left-arrow.png" width="10px" height="10px">
					</button>
				</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='masterBoard.do?pageNum=${i}'">${i}</span>
			</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='masterBoard.do?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class=last onclick="location.href='masterBoard.do?pageNum=${endPage + 1}'">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
						<img alt="다음" src="../../images/right-arrow.png" width="10px" height="10px">
					</button> 
				</c:if>
		</div> <!-- number -->
	</div> <!-- paging -->
</section>
</body>
</html>