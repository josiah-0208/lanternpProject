<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festHome.css?5");</style>
<script type="text/javascript" src="/lanternProject/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('.title1').fadeIn(2400);
		
		setTimeout(function() {
			$('.fade_box').fadeIn(1800);
			$('.title2, .main, .login').css('transition','3.2s').css('transform','translateY(-6px)');
		}, 2200);
		
		$('.main, .login').mouseenter(function() {
			$(this).css('color', 'orange');
			$('.title2, .main, .login').css('transition','');
		})
		$('.main, .login').mouseleave(function() {
			$(this).css('color', 'white');
		})
		
	})
</script>
</head>
<body>
	<div class="video_box">
		<video src="/lanternProject/css/homevideo4.mp4" muted autoplay loop></video>
	</div>
	
	<div class="title1">축제를 비추다</div>
	<div class="fade_box">
		<div class="title2">등불</div>
			
		<div class="main" onclick="location.href='festMain.so?tab=1'">둘러보기</div>
		<div class="login" onclick="location.href='../member/loginForm.do'">로그인</div>
	</div>
		
</body>
</html>