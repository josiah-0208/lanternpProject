<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBookmarkList .dot").css("display", "block");
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
	function del(delreview_no) {
		var con = confirm("해당 댓글을 삭제 하시겠습니까?");
		if(con) {
			location.href="../board/replyDelete.en?review_no=${board.review_no}&reply_no="+reply_no;
		}
	}
</script>
<style type="text/css">
nav { background: gray; height: 400px; float: left; width: 20%; }
table { background-color: #FAF0E6; width:  100%;	}
td { background-color:#FFFFE0; 		}
th { background: #228B22; 			}
td, th { padding: 12px; border: 1px solid green; }
article { background: pink; height: 400px; float: left; width: 80%; }
</style>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<nav><jsp:include page="profileMenu.jsp"></jsp:include></nav>
		<article>
		<!-- 내용 -->
		<div class="container-table">
		<table>
			<tr>
				<th>글번호</th><th>글제목</th><th>내가 쓴 댓글</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="4">데이터가 존재하지 않습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${blist }">
				<tr>	<td>${board.review_no} </td>
						<td> ${board.title }</td><td>
								<c:forEach var="reply" items="${list }">
									<c:if test="${reply.review_no==board.review_no }">
										<img alt="" src="../../images/level.gif" height="5" width="10">
										<img alt="" src="../../images/re.gif">
										<a href="../board/boardUpdateForm.en?review_no=${board.review_no}">${reply.rp_content }</a><br>
									</c:if>
								</c:forEach>
						</td>
					</c:forEach>
			</c:if>		
		</table>
	</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myReply.do?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
							<img alt="이전" src="../../images/left-arrow.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myReply.do?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myReply.do?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myReply.do?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/right-arrow.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myReply.do?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../images/right-arrow.png">
							<img alt="다음" src="../../images/right-arrow.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
		</article>
	</div>
</body>
</html>