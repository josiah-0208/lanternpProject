<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css?1">
<link rel="stylesheet" type="text/css" href="../../css/boardWrite.css">
</head>
<body>
	<form action="boardWriteAction.en" method="post">
		<input type="hidden" name="member_no" value="${member_no }">

	<div class="top_title">후기 작성</div>
		
		<!-- 게시판 글 작성 폼 -->
		<div class="container">
			<div class="bd_title">
				<div>
					<pre>
						<textarea name="title" maxlength="20" autofocus="autofocus"
						class="title_textarea" rows="1" cols="50" style="resize: none;"
						placeholder="제목을 입력하세요. (최대 20자)" ></textarea>
					</pre>
				</div>
			</div>
			<div class="bd_content">
				<div>
					<pre>
						<textarea name="content" maxlength="2999" style="resize: none;"
						class="content_textarea" rows="30" cols="150"
						placeholder="내용을 입력하세요. (최대 2999자)" ></textarea>
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
		</div>
	</form>
</body>
</html>