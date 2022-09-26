<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festView.css");</style>
<script type="text/javascript" src="/lanternProject/js/jquery.js"></script>
<script type="text/javascript">
	$(function () {
		// 초기에 보내준 북마크 값을 확인해서 값이 동일하면 css 체크된 이미지 url,
		// 다르면, 기준 안두고
		
	});
	function bookmark() 
	//펑션으로 북마크() 만들고, 누르면 업데이트 되게 
</script>
</head>
<body>
<div class="container">
	<div class="view_content">
		<div class="view_title">
		${festival.fname }
		</div>
		<div class="view_top">
			<div class="top_img">
			</div>
			<div class="top_content">
				<div>${festival.intro }</div>
				<div>기간: ${festival.start_date } ~ ${festival.end_date }</div>
				<div>운영시간: ${festival.hours }</div>
				<div>주최: ${festival.host }</div>
				<div>장소: ${festival.spot }</div>
				<div>입장료: ${festival.fee }원</div>
				<div>어린이: ${festival.fee_child }원 중고등학생: ${festival.fee_teen }원 성인: ${festival.fee_adult }</div>	
				<div>
					<div class="bookmark1" onclick="bookmark()">북마크</div>
					<div class="bookmark2" onclick="bookmark()">북마크</div>
					<div class="reserve">예매</div>
				</div>
			</div>
		</div>
		<div class="view_middle">
			<div class="tel home_pg">
			전화번호 : ${festival.tel }  홈페이지 : ${festival.home_pg }	
			</div>
			<div class="addr">
			주소 : ${festival.addr } 
			</div>
			<div class="f_txt">
			${festival.f_txt }
			</div>
		</div>
		<div class="view_bottom">
			<div class="view_update" onclick="location.href='festUpdateForm.so?fno=${festival.fno}'">수정
			</div>
			<div class="view_delete" onclick="location.href='festDelete.so?fno=${festival.fno}'">삭제
			</div>
		</div>
	</div>
</div>


</body>
</html>