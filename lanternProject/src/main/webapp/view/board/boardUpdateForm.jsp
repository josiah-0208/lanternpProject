<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
</head>
<body>
<!-- 게시글 수정 폼 -->
<form action="boardUpdateAction.en" method="post">
	<input type="hidden" name="review_no" value="${board.review_no }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="member_no" value="1">
	<table><caption>게시글 수정</caption>
		<tr>
			<td><pre><textarea name="title" maxlength="2999"
						rows="1" cols="50" style="background-color: transparent; color: white;"
						placeholder="제목을 입력하세요. (최대 20자)" >${board.title}</textarea></pre>
			</td>
		</tr>
		<tr>
			<td><pre><textarea name="content" maxlength="2999"
						rows="30" cols="150" style="background-color: transparent; color: white;"
						placeholder="내용을 입력하세요. (촤대 2999자)" >${board.content}</textarea></pre>
			</td>
		<tr><td><input type="file" name="fileData">
				<input type="submit" name="수정">
			</td>
	</table>
</form>
</body>
</html>