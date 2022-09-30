<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                
                                
        <link rel="stylesheet" href="../../css/log_joinForm.css" >
        
        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="../../js2/jsf.js"></script>
		<script type="text/javascript">
			function chk(){
				/* var div = document.getElementById("div2"); */
				var pw= document.getElementById("pw");
				var pwChk= document.getElementById("pwChk");
 		 	 if(pw.value!=pwChk.value){
				alert("암호와 암호 확인이 다릅니다"); pw.value="";
				pw.focus(); pwChk.value="";
				return false; 
			 }   
		}
			function dupChk() {
				var id = document.getElementById("idChk");
		
				if (!id.value) {	alert("아이디를 입력하고 체크하세요");
					id.focus(); return false; 			
				}
				$.post("dupChk.do","id="+id.value,function(data){
					$('#err').html(data);
				});
			}
			function forgotPopup(){
				window.open("findForm.do","","width=700 height=700 left=700px top=100px scrollbars=no loaction=no toolbars=no status=no");
			}
		</script>
    </head>
    <body>
        <div id="d1">
           <div class="panel shadow1" id="d2">
                <form class="login-form" name="frm"action="joinResult.do" onsubmit="return chk()" method="post">
                    <div class="panel-switch animated fadeIn">
                        <button type="button" id="sign_up" class="" disabled>회원가입</button>
                        <button type="button" id="log_in" class="active-button" onclick="location.href='loginForm.do'">로그인</button>
                    </div>
                    <h1 class="animated fadeInUp animate1" id="title-signup">처음 뵙겠습니다!</h1>
                    <fieldset id="signup-fieldset" name="sign">
                        <input class="login animated fadeInUp animate2" name="id" type="textbox"  required   placeholder="ID" value="" id="idChk"><br>
                        <a class="chk-btn animated fadeInUp animate2" onclick="dupChk()" >중복 체크</a>
						<div class="chk-msg" id="err"></div>
                        <input class="login animated fadeInUp animate3" name="password" type="password" placeholder="비밀번호"  required  value="" id="pw">
                        <input class="login animated fadeInUp animate3" name="passwordchk" type="password" placeholder="비밀번호 확인"  required  value="" id="pwChk">
                        <input class="login animated fadeInUp animate4" name="name" type="text" placeholder="성명"  required  value="">
                        <input class="login animated fadeInUp animate5" name="email" type="email" placeholder="E-mail"  required  value="">
                        <input class="login animated fadeInUp animate6" type="tel" name="phone" required="required"placeholder="010-0000-0000" pattern="010-\d{3,4}-\d{4}" title="형식 010-1111-1111">
                    </fieldset>
                    <input type="submit" id="signup-form-submit" class="login_form button animated fadeInUp animate7" value="Sign up">
                    <p><a id="lost-password-link" onclick="forgotPopup()" class="animated fadeIn animate7">아이디나 비밀번호를 잊어버리셨나요?</a></p>
                </form>
            </div>
        </div>
    </body>
</html>