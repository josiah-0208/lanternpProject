<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<link rel="stylesheet" type="text/css" href="../../css/boardWrite.css?1">
</head>
<body>
<!-- 게시글 수정 폼 -->
<form action="boardUpdateAction.en" method="post">
	<input type="hidden" name="review_no" value="${board.review_no }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="member_no" value="1">
	<div class="container">
	<div class="top_title">게시글 수정</div>

			<div class="bd_title">
					<pre>
						<textarea class="title_textarea" name="title" maxlength="2999"
						rows="1" cols="50" style="resize: none;" 
						placeholder="제목을 입력하세요. (최대 20자)" >${board.title}</textarea>
					</pre>
				
			</div>
			<div class="bd_content">
					<pre>
						<textarea class="content_textarea" name="content" maxlength="2999"
						rows="30" cols="150" style="resize: none;"
						placeholder="내용을 입력하세요. (촤대 2999자)" >${board.content}</textarea>
					</pre>
			</div>
	</div>
	
	<div class="submit">
		<div></div>
		<div>
			<input type="submit" value="게시">
		</div>
		<div>
			<button type="button" onclick="history.back()">취소</button>
		</div>
		<div></div>
	</div>
	
</form>
</body>
</html>