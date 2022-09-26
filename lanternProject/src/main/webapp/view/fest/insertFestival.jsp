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
	FestivalDao fd = FestivalDao.getInstance();

	for (int i = 0; i <= 40; i++) {
		
		Festival festival = new Festival();
		
		festival.setFname("제15회 제주해비치아트페스티벌강원"+i);
		festival.setThumbnail("제주해비치아트페스티벌.jpg");
		festival.setStart_date(Date.valueOf("2022-09-19"));
		festival.setEnd_date(Date.valueOf("2022-10-01"));
		festival.setHours("종일");
		festival.setIntro("Over the Bridger, 다리를 넘어");
		festival.setHost("한국문화예술회관연합회(코카카)");
		festival.setLoc("강원지역");
		festival.setAddr("제주특별자치도 서귀포시 표선면 민속해안로 537");
		festival.setSpot("해비치호텔앤드리조트 제주 및 제주도 내 공연장 일원 등");
		festival.setHome_pg("http://www.jhaf.or.kr");
		festival.setTel("02-3019-5853~6");
		festival.setFee(8000);
		festival.setF_image("제주해비치아트페스티벌_상세.jpg");
		festival.setF_txt("전국 공연장 관련 장비업체 등 문화예술 산업 종사자 간 정보제공");
		
		fd.insert(festival);
	}
%>
입력성공
</body>
</html>