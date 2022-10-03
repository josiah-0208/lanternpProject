<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/common.css?s");</style>
<style type="text/css">@import url("/lanternProject/css/find.css?s");</style>

<script type="text/javascript">
	function wincl(){
		<%-- // opener: joinform.jsp<%=id%>자바스크립트에서는 앞뒤에 큰 따옴표 안에 넣어야한다 --%>
		window.close(); //현재창 닫기
	}
</script>
</head>
<body>
<div class="panel">
	<div class="find">
		<h5 class="title">아이디 찾기</h5>
		<form action="findIdResult.do" method="post">
			<input type="text" name="name" placeholder="이름" required="required"><br> 
			<input type="tel" name="phone" placeholder="연락처" required="required"> 
			<input id="btn1" type="submit" class="fbutton" value="아이디 찾기">
		</form>
	</div>

	<div class="find">
		<h5 class="title">비밀번호 찾기</h5>
		<form action="findPwResult.do" method="post">
			<input type="text" name="id" placeholder="아이디 (이메일)" required="required" ><br> 
			<input type="text" name="name" placeholder="이름" required="required" > 
			<input id="btn2" type="submit" class="fbutton" value="비밀번호 찾기">
		</form>
	</div>
	<button id="btn3" onclick="wincl()">창닫기</button>
</div>


</body>
</html>