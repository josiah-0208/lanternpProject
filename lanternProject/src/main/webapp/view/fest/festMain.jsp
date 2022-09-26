<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/festMain.css?2");</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		
		if (${tab} === 2) {
			$('#tab2').addClass("active");
		} else {
			$('#tab1').addClass("active");
		}
		
		$('.filter').on('click', function() {
			$('.filter_modal').show();
			$('html body').css('overflow', 'hidden');
		}) 
	
		$('.close, .modal_btn, .modal_background').on('click', function() {
			$('.filter_modal').hide();
			$('html body').css('overflow', 'auto');
		})
		
		
		
	})
</script>
</head>
<body>
<div class="container_main">
	<div class="festival_tab"> 
			<div class="title" id="tab1" onclick="location.href='festMain.so?tab=1'">진행중인</div>
			<div class="title" id="tab2" onclick="location.href='festMain.so?tab=2'">예정된</div>
			<div>넘어오는 값 체크</div>
	</div>
	<div class="filter_box">
		<div class="filter">
			<img src="/lanternProject/images/icons/filter.png" style="width: 25px">
		</div>				
	</div>
	<!-- 축제 리스트 불러오기 뷰, 썸네일이미지파일, 데이터 입력 해야함-->
	 <div class="festival_list">
		<c:if test="${tab == 1}">
			<c:if test="${empty loc}">
				<c:forEach var="festival" items="${list }">
					<c:if test="${today >= festival.start_date && festival.end_date >= today }">
						<div class="item" onclick="location.href='festView.so?fno=${festival.fno}'">
							<div class="item_thumb">
								<img class="fest_img" src="/lanternProject/images/festival/${festival.thumbnail }">
							</div>
							<div class="item_fname">${festival.fname }
							</div>
							<div class="item_term">${festival.start_date }//${today } ~ ${festival.end_date }
							</div>
							<div class="item_loc">${festival.loc }
							</div>
							<div class="item_intro"> ${festival.intro }
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty loc }">
				<c:forEach var="festival" items="${listLoc }">
					<c:if test="${festival.start_date <= today && festival.end_date >= today }">
						<div class="item" onclick="location.href='festView.so?fno=${festival.fno}'">
							<img style="background: url(/lanternProject/images/festival/${festival.thumbnail}) no-repeat center; background-size: contain;">
							<div class="item_fname">${festival.fname }
							</div>
							<div class="item_term">${festival.start_date } ~ ${festival.end_date }
							</div>
							<div class="item_loc">${festival.loc }
							</div>
							<div class="item_intro"> ${festival.intro }
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>
	</div>
	<div class="festival_list">
		<c:if test="${tab == 2}">
			<c:if test="${empty loc}">
				<c:forEach var="festival" items="${list }">
					<c:if test="${today <= festival.start_date}">
						<div class="item" onclick="location.href='festView.so?fno=${festival.fno}'">
							<div class="item_thumb">
								<img class="fest_img" src="/lanternProject/images/festival/${festival.thumbnail }">
							</div>
							<div class="item_fname">${festival.fname }
							</div>
							<div class="item_term">${festival.start_date }//${today } ~ ${festival.end_date }
							</div>
							<div class="item_loc">${festival.loc }
							</div>
							<div class="item_intro"> ${festival.intro }
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty loc }">
				<c:forEach var="festival" items="${listLoc }">
					<c:if test="${festival.start_date >= today}">
						<div class="item" onclick="location.href='festView.so?fno=${festival.fno}'">
							<img style="background: url(/lanternProject/images/festival/${festival.thumbnail}) no-repeat center; background-size: contain;">
							<div class="item_fname">${festival.fname }
							</div>
							<div class="item_term">${festival.start_date } ~ ${festival.end_date }
							</div>
							<div class="item_loc">${festival.loc }
							</div>
							<div class="item_intro"> ${festival.intro }
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>
	</div>
	
	
	<div class="paging">
		<div class="paging_box">
			<div class="pre_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="pre1" onclick="location.href='festMain.so?tab=${tab }&pageNum=${startPage - 1}&loc=${loc }'">
						<img alt="이전" src="/lanternProject/images/icons/arrow_left1.png">
						<img alt="이전" src="/lanternProject/images/icons/arrow_left1.png">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="pre2" onclick="location.href='festMain.so?tab=${tab }&pageNum=${currentPage - 1}&loc=${loc }'">
						<img alt="이전" src="/lanternProject/images/icons/arrow_left1.png">
					</button>
				</c:if>
			</div>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='festMain.so?tab=${tab }&pageNum=${i}&loc=${loc }'">${i}</span>
			</c:forEach>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next1" onclick="location.href='festMain.so?tab=${tab }&pageNum=${currentPage + 1}&loc=${loc }'">
						<img alt="다음" src="/lanternProject/images/icons/arrow_right.png">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class=next2 onclick="location.href='festMain.so?tab=${tab }&pageNum=${endPage + 1}&loc=${loc }'">
						<img alt="다음" src="/lanternProject/images/icons/arrow_right.png">
						<img alt="다음" src="/lanternProject/images/icons/arrow_right.png">
					</button> 
				</c:if>
			</div>	
		</div>
	</div>
</div>

<div class="filter_modal">
	<div class="modal_background"></div>
	<form action="festMain.so?tab=${tab}" method="post">
		<div class="modal_content">
			<img class="modal_close"></img>
			<p class="modal_title">지역 선택</p>
			<div class="tag_box">
				<div class="tag_item">
					<label class="tag" for="l1">서울/경기/인천</label>
					<input type="checkbox" name="loc" id="l1" value="서울/경기/인천">
				</div>
				<div class="tag_item">
					<label class="tag" for="l2">강원 지역</label>
					<input type="checkbox" name="loc" id="l2" value="강원지역">
				</div>
				<div class="tag_item">
					<label class="tag" for="l3">충청 지역</label>
					<input type="checkbox" name="loc" id="l3" value="충청지역">
				</div>
				<div class="tag_item">
					<label class="tag" for="l4">전라 지역</label>
					<input type="checkbox" name="loc" id="l4" value="전라지역">
				</div>
				<div class="tag_item">
					<label class="tag" for="l5">경상 지역</label>
					<input type="checkbox" name="loc" id="l5" value="경상지역">
				</div>
				<div class="tag_item">
					<label class="tag" for="l6">제주 지역</label>
					<input type="checkbox" name="loc" id="l6" value="제주지역">
				</div>
			</div>
			<div class="modal_btn">
				<input type="submit" value="조회"> 
			</div>
		</div>
	</form>
</div>

</body>
</html>