<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/lanternProject/css/profileMenu.css?a");</style>
<style type="text/css">@import url("/lanternProject/css/common.css?a");</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBookmarkList .dot").css("display", "block");
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
</script>
<!-- <style type="text/css">
nav { background: gray; height: 400px; float: left; width: 20%; }
table { background-color: #FAF0E6; width:  100%;	}
td { background-color:#FFFFE0; 		}
th { background: #228B22; 			}
td, th { padding: 12px; border: 1px solid green; }
article { background: pink; height: 400px; float: left; width: 80%; }
</style> -->
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<nav><jsp:include page="profileMenu.jsp"></jsp:include></nav>
		<article>
		<!-- 내용 -->
		<div class="content1">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">북마크한 축제가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<div style="position:relative; left:30px;"><h3>북마크한 축제 - ${total}개</h3></div>
				<br>
				<div class="content2">
					<c:forEach var="fest" items="${flist}">
						<div class="boomarkOb">
							<div class="thumbnail_box" onclick="location.href='../fest/festView.so?fno=${fest.fno}'">
									<img alt="포스터" src="/lanternProject/images/festival/${fest.thumbnail}" style="width: 100%; height: 100%;"> 
							</div>
							<div>${fest.fname }</div>
							<div>${fest.spot }</div>
							<div>${fest.start_date }~${fest.end_date }</div>
						</div>
					</c:forEach>
				</div>
		</c:if>
		</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myBookmark.do?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
							<img alt="이전" src="../../images/left-arrow.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myBookmark.do?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myBookmark.do?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myBookmark.do?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/right-arrow.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myBookmark.do?pageNum=${endPage + 1}'">
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