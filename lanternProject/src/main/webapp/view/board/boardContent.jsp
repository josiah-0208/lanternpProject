<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="member_no" value='${sessionScope.member_no}'></c:set>
<c:set var="id" value='${sessionScope.id}'></c:set>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<link rel="stylesheet" type="text/css" href="../../css/boardContent.css">
<script type="text/javascript" src="/lanternProject/js/jquery.js"></script>
<script type="text/javascript">

	/* 게시글 좋아요 */
	$(function () {
		if (${check} === 1) {
			$('.likes_off').hide();
		} else {
			$('.likes_on').hide();
		};
			
		$('.likes_on').on('click', function() {
			$('.likes_off').show();
			$('.likes_on').hide();
		});
			
		$('.likes_off').on('click', function() {
			$('.likes_on').show();
			$('.likes_off').hide();
		});
	});
	
	function likes_updt() {
		if (${empty id}) {
			var con = confirm("로그인이 필요합니다.");
			$('.likes_off').show();
			$('.likes_on').hide();
			if (con) {
				location.href="/lanternProject/view/member/loginForm.do";
			}
		} else {
			$.post("boardLikesUpdate.en", "review_no=${board.review_no}");		
		}
	}
	
	/* 게시글 삭제 */
	function del() {
		var bdt = confirm("정말 삭제하시겠습니까?");
		if (bdt) location.href = "boardDelete.en?review_no=${board.review_no}";
		else alert("삭제가 취소되었습니다");
	};
	
	/* 댓글 삭제 */
	function reply_del(reply_no) {
		var rdt = confirm("정말 삭제하시겠습니까?");
		if (rdt) location.href = "replyDelete.en?review_no=${board.review_no}&reply_no="+reply_no;
		else alert("삭제가 취소되었습니다");
	}
	
	
</script>
</head>
<body>
	<div class="top">게시글</div><p>
	<!-- 게시글 불러오기 -->
	<table class="board_view">
		<tr>
			<th width="50">제목</th>
			<td>${board.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.member_no }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.read_cnt }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.reg_date}</td>
		</tr>
		<tr class="content">
			<th>내용</th>
			<td>
				<pre>${board.content}</pre>
			</td>
		</tr>
	</table>
	<!-- 좋아요 -->
	<div class="likes_btn">
		<div onclick="likes_updt()">
			<img class="likes_off" alt="채운하트" src="/lanternProject/images/orangeHt.png" width="50" height="50">
			<img class="likes_on" alt="빈 하트" src="/lanternProject/images/transHt.png" width="50" height="50">
		</div>
	</div>
	<p>
	
	<div align="center">
		<c:if test="${member_no==board.member_no }">
		<button onclick="location.href='boardUpdateForm.en?review_no=${board.review_no}&pageNum=${pageNum }'">수정</button>
		<button onclick="del()">삭제</button>
		</c:if>
		<button onclick="location.href='boardList.en?pageNum=${pageNum }'">목록</button>
	</div>

	<!-- 댓글 -->
	<div>
		<form action="replyWrite.en" method="post">
			<input type="hidden" name="review_no" value="${board.review_no}">
			<input type="hidden" name="member_no" value="${sessionScope.member_no}">
			<input type="hidden" name="reply_no" value="${reply.reply_no }">
				<!-- 댓글 작성 -->
				<div class="reply_write">
					<pre>
						<textarea class="reply_text" name="rp_content" maxlength="300"
						rows="5" cols="80" required="required" style="resize: none;"
						placeholder="댓글을 입력하세요. (최대 300자)"></textarea>
					</pre>
					<input class="submit" type="submit" value="댓글 작성">
				</div>
		</form>
				<!-- 댓글 리스트 -->
		<div>
	 		<c:if test="${empty rp_list }">
				<div>
					작성된 댓글이 없습니다.
				</div>
			</c:if>

			<!-- 게시글 데이터가 있으면 -->
			<c:if test="${not empty rp_list }">
				<c:forEach var="reply" items="${rp_list }">
				<c:if test="${reply.rp_del == 'n' }">
				<table>
					<colgroup>
						<col width="10%" />
						<col width="64%" />
						<col width="10%" />
						<col width="3%" />
						<col width="3%" />
					</colgroup>
					<tr>		
						<th>
							${reply.member_no }
						</th>
						<th>
							${reply.rp_content }
						</th>
						<th>
							${reply.rp_reg_date }
						</th>
						<c:if test="${member_no==reply.member_no }">
							<th>
								<a onclick="reply_del(${reply.reply_no})">
									<img alt="" src="/lanternProject/images/icons/delete_white.png" width="20px" height="20px">
								</a>
							</th>
						</c:if>
					</tr>
				</table>
				
				</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>