<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
		var preUrl = document.referrer.split("/")[6];
		alert("삭제 되었습니다");
		if(preUrl == "festList.do") {
			history.back();
		}else  {
			location.href="../fest/festMain.so?tab=1";
		}
</script>
</body>
</html>