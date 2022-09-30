<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">@import url("/lanternProject/css/common.css?1");</style>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font online-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
      
<!--        Animate.css-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
                
                                
        <link rel="stylesheet" href="../../css/updateForm.css" >
        
        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="../../js2/jsf.js"></script>
		<script type="text/javascript">
		function del(member_no) {
			var con = confirm("탈퇴 하시겠습니까?");
			if(con) location.href="delete.do?member_no="+member_no;
			else alert("탈퇴가 취소 되었습니다.");
		}
		</script>
</head>
    <body>
        <div>
           <div class="panel shadow1">
                <form class="update-form" action="updateResult.do?prevUrl=${prevUrl }" method="post" name="frm" onsubmit="chk()" enctype="multipart/form-data">
                    <!-- 엔터키 전송 막기 -->
					<div style="display:none">
						<input type="submit" onclick="return false"/>
						<input type="text"/>
					</div>
                    <div class="animated fadeIn">
                        <h1 class="animated fadeInUp animate1" id="title-update">회원정보</h1>
                    </div>
						<!-- 프로필 -->
					<div class="profile">
						<div id="image_container">
							<img src="<%-- /semojeon/upload/${member.profile } --%>" alt="프로필사진">
						</div> 														<!-- 프로필 경로 설정 -->
						<label for="f1" class="file_profile">프로필 사진 업로드</label>
						<input type="file" id="f1" name="profile" onchange="setProfile(event)" value="${member.profile}">
					</div>
                    <fieldset id="update-fieldset">
						<input class="login animated fadeInUp animate2" type="text" name="id" readonly="readonly" value="${member.id }" placeholder="${member.id }">
						<input class="login animated fadeInUp animate3" type="password" name="password" placeholder="비밀번호" required="required" > 
						<input class="login animated fadeInUp animate3" type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
						<input class="login animated fadeInUp animate4" type="text" name="name" value="${member.name }" placeholder="${member.name }">
						<input class="login animated fadeInUp animate5" name="email" type="email" readonly="readonly" placeholder="${member.email }" value="${member.email }">
						<input class="login animated fadeInUp animate6" type="tel" name="phone" value="${member.phone }" placeholder="${member.phone }">
                    </fieldset>
                    <input type="submit" id="update-form-submit" class="update_form button animated fadeInUp animate7" value="회원정보 수정">
               <br> <a class="animated fadeInUp animate7"id="delete" onclick="del(${member.member_no})" style="text-decoration: underline;">회원탈퇴</a>
                </form>
            </div>
        </div>
    </body>
</html>