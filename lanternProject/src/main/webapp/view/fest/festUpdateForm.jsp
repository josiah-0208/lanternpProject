<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festRegist.css?2");</style>
<style type="text/css">@import url("/lanternProject/css/common.css?3");</style>
<script type="text/javascript" src="/lanternProject/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var selectValue = ${festival.loc};
		$('select option[value='+selectValue+']').attr('selected', true);
	})
</script>
</head>
<body>
<div class="layout">
	<div class="container">
		<div class="title">
			<p>축제 수정</p>
		</div>
		<div class="contents">
			<form action="festUpdateResult.so?fno=${festival.fno }" method="post" name="frm" enctype="multipart/form-data">
				<div class="line">
					<div class="line-tag">
						축제명
					</div>
					<div class="fname">
						<input type="text" name="fname" value="${festival.fname }" required>
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						간략한 소개
					</div>
					<div class="intro">
						<input type="text" name="intro" placeholder="축제 소개 문구" value="${festival.intro }" required>
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						기간
					</div>
					<input type="date" name="start_date" value="${festival.start_date }" required>
					&nbsp;~&nbsp;
					<input type="date" name="end_date" value="${festival.end_date }" required>
				</div>
				
				<div class="line" id="line">
					<div class="line-tag">
						운영 시간
					</div>
					<div class="hours">
						<input type="text" name="hours" placeholder="*예) 오전 09:00 ~ 오후 17:00" value="${festival.hours }">
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						주최
					</div>
					<div class="host">
						<input type="text" name="host" value="${festival.host }" required>
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
						<input type="text" name="addr" value="${festival.addr }" required>
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						행사 장소
					</div>
					<div class="spot">
						<input type="text" name="spot" value="${festival.spot }">
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag" >
						홈페이지 주소
					</div>
					<div class="home_pg">
						<input type="text" name="home_pg" value="${festival.home_pg }">
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						문의 전화
					</div>
					<div class="tel">
						<input type="tel" name="tel" value="${festival.tel }">
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
							<input type="number" name="fee_child" value="${festival.fee_child }">
						</div>
						
					</div>
				</div>
				<div class="line">
					<div class="fee_detail">
						<div class="line-tag">
							청소년
						</div>
						<div class="spot">
							<input type="number" name="fee_teen" value="${festival.fee_teen }">
						</div>
					</div>
				</div>
				<div class="line">
					<div class="fee_detail">
						<div class="line-tag">
							어른
						</div>
						<div class="spot">
							<input type="number" name="fee_adult" value="${festival.fee_adult }">
						</div>
					</div>
				</div>
				
				<div class="txt">
					<div class="txt_tag">
						상세 설명
					</div>
						<textarea maxlength="1000" wrap="hard" name="f_txt" placeholder="상세 정보는 1000자까지 입력할 수 있습니다.">${festival.f_txt }</textarea>
				</div>
				
				<div class="line">
					<div class="line-tag">
						포스터
					</div>
					<div class="thumbnail">
						<input type="file" id="f1" name="thumbnail" required>${festival.thumbnail }
					</div>
				</div>
				
				<div class="line">
					<div class="line-tag">
						상세 이미지
					</div>
					<div class="f_image">
						<label for="f2">${festival.f_image }</label>
						<input type="file" id="f2" name="f_image" required>
					</div>
				</div>
				
				<div class="line">
					<div class="confirm btn">
						<input type="submit" value="수정하기">
						<input type="button" onclick="history.back()" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>	
</body>
</html>