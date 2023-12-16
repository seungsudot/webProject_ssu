<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>Add Products</title>
</head>
<body>
<%@ include file="./menu.jsp" %>
<%
	if(!isName) {
%>
	<script>
		alert("로그인이 필요합니다.");
		location.href="login.jsp"		
	</script>
<% 
	} else {
%>
<div class="send-message">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading"><h2>상품 추가</h2></div>
			</div>
			<div class="col-md-8">
			<div class="contact-form">
			<!-- <form method='post' enctype = "mulitpart/form-data" action ='addProducts_process.jsp' >
				<p> 상품명 <input type ="text" name ="pTitle">
				<p> 금액 <input type ="text" name ="pPrice">
				<p> 사진 <input type ="file" name ="pImage">
				<p> 설명 <input type ="text" name ="pText">
				<p> 현황 <input type ="text" name ="pTotal">
				<p> 목표인원 <input type ="text" name ="pTarget">
				<p> 웹주소 <input type ="text" name ="pUrl">
				<p> 현황(진행중/마감/취소) <input type ="text" name ="pStatus">
				포스트 번호는 auto increment, 아이디 값은 따로 입력하지 않아도 되게끔 함
				<p> <input type ="submit" value ="전송">
			</form> -->
			<form id="contact" method="post" enctype="multipart/form-data" action ='addProducts_process.jsp'>
                <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="name" class="form-label mt-4">상품명</label>
                      	<input type="text" class="form-control" name ="pTitle" id="name" placeholder="상품의 이름을 입력해주세요." required>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                  		<label for="price">금액</label>
                      	<input type="number" class="form-control" name ="pPrice" id="price" placeholder="상품의 가격을 입력해주세요." required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="description">상품 설명</label>
                    	<textarea rows="6" class="form-control" name ="pText" id="description" placeholder="상품 설명을 입력해주세요" required=""></textarea>
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="image">상품 이미지</label>
                    	<input type="file" class="form-control" name ="pImage" id="image" placeholder="상품의 이미지를 업로드해주세요." required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                    	<label for="url">사이트 주소</label>
                    	<input type="text" class="form-control" name ="pUrl" id="url" placeholder="상품을 구매할 사이트 주소를 입력해주세요." required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12">
                    <fieldset>
                    	<label for="target">목표 인원</label>
                      	<input type="number" class="form-control" name ="pTarget" id="target" placeholder="펀딩 진행을 위한 목표 인원을 입력해주세요." required="">
                    </fieldset>
                  </div>
                  <!-- 
	                  <div class="col-lg-12">
	                    <fieldset>
	                    	<label for="total">현황</label>
	                      	<input type="number" class="form-control" id="total" placeholder="현황" required="">
	                    </fieldset>
	                  </div>
                 -->
                  <div class="col-lg-12">
                    <fieldset>
                      <button type="submit" id="form-submit" class="filled-button">상품 등록</button>
                    </fieldset>
                  </div>
                </div>
              </form>
			</div>
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
<% } %>