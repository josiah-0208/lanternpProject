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
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<script type="text/javascript">

</script>
</head>
<body>
		<h2>축제 후기</h2>
			<!-- 후기 게시글 작성 버튼 -->
			<div>
				<div>
					<a href="boardWriteForm.en">글작성</a>
					<ul></ul>
				</div>
				<hr>
			</div>
			<table>
				<!-- 테이블 헤드 간격 설정 -->
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>❤</th>
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
										${board.member_no }
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
									<th>
										${board.likes }
									</th>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				
			</table>
		</div>
		<hr>


		<!-- 게시판 페이징 -->
		<div align="center">
			<!-- startPage가 PAGE_PER_BLOCK보다 크다면 앞에 보여줄 내용이 있는 것 -->
			<c:if test="${startPage - PAGE_PER_BLOCK > 0 }">
	
				<button
					onclick="location.href='boardList.en?pageNum=${startPage-1 }'">◀</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
			
				<!-- 숫자를 클릭하면 그 숫자에 해당하는 page를 출력한다 -->
				<c:if test="${currentPage == i }">
					<button onclick="location.href='boardList.en?pageNum=${i }'"
						style="background: skyblue; color: black">${i }</button>					</c:if>
				<c:if test="${currentPage != i }">
					<button onclick="location.href='boardList.en?pageNum=${i }'">${i }</button>
				</c:if>
				
			</c:forEach>
			<!-- endPage가 totalPage가 작다는 것은 아직 보여줄 것이 남아있는 것 -->
			<c:if test="${endPage - totalPage < 0 }">
				<button onclick="location.href='boardList.en?pageNum=${endPage+1 }'">▶</button>
			</c:if>
		</div>
</body>
</html>