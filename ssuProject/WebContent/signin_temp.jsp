<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>Sign up</title>
</head>
<script>
	function checkLogin() {
		var form = document.loginForm;
		if(form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		} 
		if(form.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.passwd.focus();
			return false;
		}
		if(form.passwd.value != form.passwdCheck.value) {
			alert("비밀번호 확인을 비밀번호 란과 동일하게 입력하세요.");
			form.passwd.focus();
			return false;
		}
		form.submit();
	}
</script>
<body>
<%@ include file="./menu.jsp" %>
<%
	if(isName) {
%>
	<script>
		alert("이미 로그인 되어있습니다.");
		location.href="welcome.jsp"		
	</script>
<% 
	}
%>
<div class="send-message"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading"><h2>회원 가입</h2></div>
			</div>
			<div class="col-md-8">
			<div class="contact-form">
			<form id="contact" method="post" action ='signin_process.jsp' name="loginForm">
                <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">아이디</label>
                      	<input type="text" class="form-control" name ="id" id="id" placeholder="아이디를 입력하세요." required>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                  		<label for="price">비밀번호</label>
                      	<input type="password" class="form-control" name ="passwd" id="passwd" placeholder="비밀번호를 입력해주세요." required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">비밀번호 확인</label>
                      	<input type="password" class="form-control" name ="passwdCheck" id="passwdCheck" placeholder="비밀번호를 입력하세요" required>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">이름</label>
                      	<input type="text" class="form-control" name ="name" id="names" placeholder="이름을 입력하세요." required>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">전화번호</label>
                      	<input type="text" class="form-control" name ="phone" id="phone" placeholder="전화 번호를 입력하세요." required>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">계좌번호</label>
                      	<input type="text" class="form-control" name ="account" id="account" placeholder="계좌 번호를 입력하세요." required>
                    </fieldset>
                  </div>
                  <div>
                    <fieldset>
                    	<input type="button" value="회원 가입" class="filled-button" onclick="checkLogin()">
                      <!--  <button type="submit" id="form-submit" class="filled-button">회원 가입</button> -->
                    </fieldset>
                  </div>
                </div>
              </form>
			</div>
			<br />
		</div>
	</div>
</div>
<div class="container" style="margin-top: 60px;">
	<hr>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>