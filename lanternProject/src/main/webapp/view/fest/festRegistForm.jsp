<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festRegist.css");</style>
<style type="text/css">@import url("/lanternProject/css/common.css");</style>
</head>
<body>
<div class="layout">
<div class="container">
	<div class="title">
		<p>축제 등록</p>
	</div>
	<div class="contents">
		<form action="festRegistResult.so" method="post" name="frm" enctype="multipart/form-data">
			<div class="line">
				<div class="line-tag">
					축제명
				</div>
				<div class="fname">
					<input type="text" name="fname" required autofocus>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					간략한 소개
				</div>
				<div class="intro">
					<input type="text" name="intro" placeholder="축제 소개 문구" required>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					시작일
				</div>
				<div class="start_date">
					<input type="date" name="start_date" required>
				</div>
				<div class="line-tag">
					종료일
				</div>
				<div class="end_date">
					<input type="date" name="end_date" required>
				</div>
			</div>
			<div class="line" id="line">
				<div class="line-tag">
					운영 시간
				</div>
				<div class="hours">
					<input type="text" name="hours" placeholder="*예) 오전 09:00 ~ 오후 17:00">
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					주최
				</div>
				<div class="host">
					<input type="text" name="host" required>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					지역
				</div>
				<div class="loc">
					<select name="loc" required>
						<option>서울/경기/인천</option><option>강원지역</option>
						<option>충청지역</option><option>전라지역</option>
						<option>경상지역</option><option>제주지역</option>
					</select>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					축제 주소
				</div>
				<div class="addr">
					<input type="text" name="addr" required>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					행사 장소
				</div>
				<div class="spot">
					<input type="text" name="spot">
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					홈페이지
				</div>
				<div class="home_pg">
					<input type="text" name="home_pg">
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					전화번호
				</div>
				<div class="tel">
					<input type="tel" name="tel">
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					단일 요금
				</div>
				<div class="fee">
					<input type="number" name="fee" placeholder="무료 기재 X">
				</div>
			</div>
			<div class="line">
				<div class="fee_detail">
					<div class="line-tag">
						어린이
					</div>
					<div class="spot">
						<input type="number" name="fee_child">
					</div>
				</div>
				<div class="fee_detail">
					<div class="line-tag">
						청소년
					</div>
					<div class="spot">
						<input type="number" name="fee_teen">
					</div>
				</div>
				<div class="fee_detail">
					<div class="line-tag">
						어른
					</div>
					<div class="spot">
						<input type="number" name="fee_adult">
					</div>
				</div>
			</div>
			<div class="txt">
				<div class="txt_tag">
					상세 설명
				</div>
					<textarea wrap="hard" name="f_txt" placeholder="상세 정보를 입력하세요."></textarea>
			</div>
			<div class="line">
				<div class="line-tag">
					포스터
				</div>
				<div class="thumbnail">
					<input type="file" name="thumbnail" required>
				</div>
			</div>
			<div class="line">
				<div class="line-tag">
					상세 이미지
				</div>
				<div class="f_image">
					<input type="file" name="f_image" required>
				</div>
			</div>
			<div class="line">
				<div class="botton_btn">
					<input type="submit" value="등록하기">
					<input type="button" onclick="history.back()" value="취소">
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>