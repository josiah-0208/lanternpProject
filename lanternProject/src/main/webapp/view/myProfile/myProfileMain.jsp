<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../sessionChk.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<nav><jsp:include page="profileMenu.jsp"/></nav>
</body>
</html>