<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<c:set var="member_no" value='${sessionScope.member_no}'></c:set>
<c:set var="id" value='${sessionScope.id}'></c:set>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<link rel="stylesheet" type="text/css" href="../../css/boardList.css?2">
<script type="text/javascript">
  //페이지 로드 시 board_list로 세팅, 페이지넘 색상 세팅
	$(document).ready(function() {
		$('#board_list1').css("display", "block");
 		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "700"
		}); 
	});
	
	// 게시판 정렬 설정 
	function filterChange() {
		var filter = document.getElementById("filter");
		var value = filter.options[filter.selectedIndex].value;
		if(value==1){
			location.href='boardList.en?pageNum=${currentPage }';
		}
		else if(value==2){
			location.href='boardList.en?pageNum=${currentPage }&filter=cnt';
		}
	} 
</script>
</head>
<body>
		<h2 class="title">축제 후기</h2>
			<!-- 게시판 정렬 설정 -->
			<div class="top">
				<div>
					<select id="filter" onchange="filterChange()" >
						<option value="1">최신순</option>
						<c:if test="${filter=='recent' }">
							<option value="2">조회순</option>
						</c:if>
						<c:if test="${filter=='cnt' }">
							<option value="2" selected="selected">조회순</option>
						</c:if>
					</select>
				</div>
			<!-- 후기 게시글 작성 버튼 -->
				<div class="write_btn">
					<a href="boardWriteForm.en?member_no=${board.member_no }">글쓰기</a>
					<ul></ul>
				</div>
			</div>
			<hr>
			
			<table>
				<!-- 테이블 헤드 간격 설정 -->
				<colgroup>
					<col width="11%" />
					<col width="55%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- 게시글 데이터가 없으면 -->
					<c:if test="${empty list }">
						<tr>
							<th colspan="5">게시글이 없습니다</th>
						</tr>
					</c:if>
					
					<!-- 게시글 데이터가 있으면 -->
					<c:if test="${not empty list }">
							<c:forEach var="board" items="${list }">
								<tr>		
									<c:if test="${board.del == 'n' }">
										<th>
											${id }
										</th>
										<th><a href="boardContent.en?review_no=${board.review_no }&pageNum=${pageNum }">
											${board.title }</a>
								 		</th>
										<th>
											${board.reg_date }
										</th>
										<th>
											${board.read_cnt }
										</th>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
		
				</tbody>
				
			</table>

		<hr>


		<!-- 게시판 페이징 -->
		<div class="paging_box" align="center">
			<!-- startPage가 PAGE_PER_BLOCK보다 크다면 앞에 보여줄 내용이 있는 것 -->
			<c:if test="${startPage - PAGE_PER_BLOCK > 0 }">
				<div onclick="location.href='boardList.en?pageNum=${startPage-1 }&filter=${filter }'">
					<img alt="이전" src="/lanternProject/images/left_arrow.png" style="width: 20px;">
				</div>
			</c:if>
			<div style="display: flex; position: relative; margin: 2px; bottom: 6px;">
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
				
					<!-- 숫자를 클릭하면 그 숫자에 해당하는 page를 출력한다 -->
					<c:if test="${currentPage == i }">
						<div onclick="location.href='boardList.en?pageNum=${i }&filter=${filter }'"
							style="color: #edbd16; margin: 3px;">${i }</div>
					</c:if>
					<c:if test="${currentPage != i }">
						<div onclick="location.href='boardList.en?pageNum=${i }&filter=${filter }'"
						style="margin: 3px;" >${i }</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- endPage가 totalPage가 작다는 것은 아직 보여줄 것이 남아있는 것 -->
			<c:if test="${endPage - totalPage < 0 }">
				<div onclick="location.href='boardList.en?pageNum=${endPage+1 }&filter=${filter }'">
					<img alt="다음" src="/lanternProject/images/right_arrow.png" style="width: 20px;">
				</div>
			</c:if>
		</div>
</body>
</html>