<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>Login</title>
</head>
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
				<div class="section-heading"><h2>로그인</h2></div>
			</div>
			<div class="col-md-8">
			<div class="contact-form">
			<form id="contact" method="post" action ='login_process.jsp'>
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
                  <div>
                    <fieldset>
                      <button type="submit" id="form-submit" class="filled-button">로그인</button>
                    </fieldset>
                  </div>
                </div>
              </form>
			</div>
			<br />
            <div class="contact-form">
            	<hr /><br />
              	<fieldset>
              		<label for="price">회원이 아니십니까?</label> <br /><br />
              		<button class="filled-button" onclick="location.href='signin_temp.jsp'">회원가입</button>
               	</fieldset>
            </div>
		</div>
	</div>
</div>
<div class="container" style="margin-top: 60px;">
	<hr>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>