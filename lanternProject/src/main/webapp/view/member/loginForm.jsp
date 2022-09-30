<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">@import url("/lanternProject/css/common.css?1");</style>
<link rel="stylesheet" href="../../css/log_joinForm.css?3" >

        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font online-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
      
		<!-- Animate.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="../../js2/jsf.js"></script>
		<script type="text/javascript">
			function forgotPopup(){
				window.open("findForm.do","","width=700 height=700 left=700px top=100px scrollbars=no loaction=no toolbars=no status=no");
			}
		</script>
</head>
    <body>
        <div>
           <div class="panel shadow1">
                <form class="login-form" name="frm">
                    <div class="panel-switch animated fadeIn">
                        <button type="button" id="sign_up" class="active-button" onclick="location.href='joinForm.do'">회원가입</button>
                        <button type="button" id="log_in" class="" disabled>로그인</button>
                    </div>
                    <h1 class="animated fadeInUp animate1" id="title-login">또 만났네요!</h1>
                    <h1 class="animated fadeInUp animate1 hidden" id="title-signup">처음 뵙겠습니다!</h1>
                    <fieldset id="login-fieldset" name="log">
                        <input class="login animated fadeInUp animate2" name="id" type="textbox"  required   placeholder="ID" value="" >
                        <input class="login animated fadeInUp animate3" name="password" type="password" required placeholder="비밀번호" value="">
                    </fieldset>
                    <input type="submit" id="login-form-submit" class="login_form button animated fadeInUp animate4" value="Log in" formaction="loginResult.do?prevUrl=${prevUrl}" formmethod="post" onclick="return logchk()">
                    <p><a id="lost-password-link" onclick="forgotPopup()" class="animated fadeIn animate7">아이디나 비밀번호를 잊어버리셨나요?</a></p>
                </form>
            </div>
        </div>
    </body>
</html>