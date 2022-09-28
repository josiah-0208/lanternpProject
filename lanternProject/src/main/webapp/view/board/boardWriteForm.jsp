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
	<form action="boardWriteAction.en" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_no" value="${board.member_no }">

	<h2>후기 작성</h2>
	<table>			
		<!-- 게시판 글 작성 폼 -->
		<tbody>
			<tr>
				<td>
					<pre>
						<textarea name="title" maxlength="20" autofocus="autofocus"
						rows="1" cols="50" style="background-color: transparent; color: white;"
						placeholder="제목을 입력하세요. (최대 20자)" ></textarea>
					</pre>
				</td>
			</tr>
			<tr>
				<td>
					<pre>
						<textarea name="content" maxlength="2999"
						rows="30" cols="150" style="background-color: transparent; color: white;"
						placeholder="내용을 입력하세요. (최대 2999자)" ></textarea>
					</pre>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="fileData" value="파일 업로드"><p>
					<input type="submit" value="게시">
				</td>
			</tr>
		</tbody>
		
	</table>
	</form>
</body>
</html>