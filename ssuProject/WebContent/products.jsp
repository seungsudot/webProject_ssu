<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>Products</title>
</head>
<body>
<%@ include file="./menu.jsp" %>
<div class="page-heading products-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
					<h4>SIGONG</h4>
					<h2>Products</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="products">
	<div class="container">
		<div class="row">
		<!-- 제품 구분 하위 메뉴 제품 완료 설정값 받아서 수정  -->
			<div class="col-md-12">
				<div class="filters">
					<ul>
						<li class="active" data-filter="*" style="font-size: 20px">모든 제품</li>
						<li data-filter=".des" style="font-size: 20px">진행중</li>
						<li data-filter=".dev" style="font-size: 20px">완료</li>
					</ul>
				</div>
			</div>
				
		<div class="col-md-12" align="right" style="padding-bottom:20px;">
		    <a href="addProducts.jsp" class="filled-button" style="font-weight: 400">상품 등록하기</a>
		</div>
		<div class="col-md-12">
			<div class="filters-content">
				<div class="row grid" style="position: relative;">
					<%@ include file ="dbconn.jsp" %>
					<%
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						String sql = "select * from post";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						String arranDiv = null;
						while (rs.next()){
							int status = 0;
							String pStatus = "";
							if (rs.getInt("pStatus") == 1) {
								arranDiv = "des";
								pStatus = "모집 중";
							} else if (rs.getInt("pStatus") == 2) {
								arranDiv = "dev";
								pStatus = "모집 완료";
							}
					%>
					<div class="col-lg-4 col-md-4 all <%=arranDiv %>">
						<div class="product-item">
						<a href="product.jsp?pseq=<%=rs.getInt("pSeq")%>">
							<img src="./images/<%=rs.getString("pImage")%>" alt="Product Image" width="300" height="200">
								<div class="down-content">
								
									<h3><%=rs.getString("pTitle")%></h3><br>
									<h6><%=rs.getInt("pPrice") %>원</h6>
									<%-- <p><%=rs.getString("pText") %></p> --%>
									<p style="font-weight: 500"><%= pStatus %></p>
									<div class="progress"> <!-- width % 수정해서 progress-bar 달성도 조작 -->
									<%-- <%=Math.round(rs.getInt("pTotal")/rs.getInt("pTarget"))%> --%>
										<div class="progress-bar progress-bar-bgc" role="progressbar" style="width: <%=rs.getInt("pTotal")*100/rs.getInt("pTarget")%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="<%=rs.getInt("pTarget")%>"></div>
									</div>
								</div>
							</a>
						</div>
					</div>
					<%
						}
					
					if (rs != null){
					rs.close();
					}
					
					if (pstmt != null){
						pstmt.close();
					}
					
					if (conn != null){
						conn.close();
					}
					%>
				</div> 
			</div>
		</div>
		<div class="col-md-12" align="center">
			<ul class="pages">
				<li><a href="#">1</a>
			</ul>
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