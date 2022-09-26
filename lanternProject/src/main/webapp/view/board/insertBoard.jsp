<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BoardDao bd = BoardDao.getInstance();
	
	for (int i = 1; i <= 100; i++) {
		Board board = new Board();
		
		board.setReview_no(i);
		board.setMember_no(i);
		board.setTitle("제목"+i);
		board.setContent("네용"+i);
	
		bd.insert(board);
	}
%>
입력성공
</body>
</html>