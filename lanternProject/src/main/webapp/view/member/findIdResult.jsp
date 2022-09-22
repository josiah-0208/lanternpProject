<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script type="text/javascript">
	function wincl(){
		<%-- // opener: joinform.jsp<%=id%>자바스크립트에서는 앞뒤에 큰 따옴표 안에 넣어야한다 --%>
		window.close(); //현재창 닫기
	}
</script>
</head>
<body>
<div class="container">
	<h1 class="title">아이디 찾기 결과</h1>
		<c:if test="${member != null }">
			아이디는 ${member.id } 입니다.
		</c:if>

		<c:if test="${member == null }">
			존재하지 않는 회원정보 입니다.
		</c:if>
</div>
	<button onclick="wincl()">창닫기</button>		
</body>
</html>