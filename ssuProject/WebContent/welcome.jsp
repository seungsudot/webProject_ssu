<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>welcome</title>
</head>
<body>
	<%@ include file="./menu.jsp" %>
	<%!
		String greeting = "���Ǵ� IT���� �������� ����Ʈ�� ���� ���� ȯ���մϴ�!";
		String tagline = "���Ǵ��б� IT ������ �кλ����� �����ϴ� �������� ����Ʈ�Դϴ�. �ʿ��� ��ǰ�� �ո����� ���ݿ� �����ϼ���. �ش� ����Ʈ�� IT ������ 6�кΰ� ��մϴ�.";
	%>
	<div class="page-heading products-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
					<h4>SIGONG</h4>
					<h2>WELCOME</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="best-features about-features">
    	<div class="container">
	        <div class="row">
	            <div class="col-md-12">
	            	<div class="section-heading"><h2><%=greeting %></h2></div>
	            </div>
	            <div class="col-md-6">
	            	<div class="right-image">
	            		<img alt="" src="./assets/images/ssu_mascot.png">
	            	</div>
	            </div>
				<div class="col-md-6">
					<div class="left-content">
						<h3>SIGONG</h3><br>
						<p style="font-size: 18px; color: #1E1E1E;">
							���Ǵ��б� IT ������ �кλ����� �����ϴ� �������� ����Ʈ�Դϴ�.<br> 
							�о��� �ʿ��� ��ǰ�� �ո����� ���ݿ� �����ϼ���.<br><br>
							�ش� ����Ʈ�� IT ������ 6�кΰ� ��մϴ�.<br>
							���� | 02-1234-5678<br><br><br>
						<!-- ���� ���� �ð� �����ص� �� �� ���ƿ� -->
						<%
							Date day = new java.util.Date();
							String am_pm = "PM";
							int hour = day.getHours(); // deprecated
							int minute = day.getMinutes(); // deprecated
							int second = day.getSeconds(); // deprecated
							if(hour / 12 == 0) {
								am_pm = "AM";
							} 
							String CT = hour + " : " + minute + " : " + second + " " + am_pm;
							out.println("���� ���� �ð� " + CT + "<br />");
						%>
						</p>
						<ul class="social-icons">
						<li><a href="#"><img src="./assets/images/facebook.png" style="width: 25px" /></a></li>
						<li><a href="#"><img src="./assets/images/instagram.png" style="width: 25px" /></a></li>
						
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
	<hr>
	<jsp:include page="footer.jsp" />
</div>
<%-- Bootstrap core JavaScript --%>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<%-- Additional Scripts--%>
<script src="assets/js/custom.js"></script>
 <script src="assets/js/owl.js"></script>
 <script src="assets/js/slick.js"></script>
 <script src="assets/js/isotope.js"></script>
 <script src="assets/js/accordions.js"></script>
</body>
</html>