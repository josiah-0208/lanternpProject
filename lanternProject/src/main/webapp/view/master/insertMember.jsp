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
	MemberDao md = MemberDao.getInstance();
	
	for (int i = 1; i <= 200; i++) {
		Member member = new Member();
		
		member.setId("abc"+i);
		member.setPassword("1234");
		member.setName("바보"+i);
		member.setPhone("010-1111"+"-"+(1000+i));
		member.setEmail("abc"+i+"@"+"naver.com");
	
		md.insert(member);
	}
%>
입력성공
</body>
</html>