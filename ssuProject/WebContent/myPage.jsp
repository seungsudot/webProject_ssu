<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<link rel ="stylesheet" href="./assets/css/flex-slider.css">
<link rel ="stylesheet" href="./assets/css/templatemo-sixteen.css">

<title>Add Products</title>
</head>
<script>

	function completeConfirmation(pSeq) {
        var result = confirm("해당 제품을 완료 처리 할까요?");
        var pSeq_imput = pSeq;
        if (result) {
            window.location.href = "completeProducts.jsp?pSeq=" + pSeq_input;
        } else {
            alert("오류");
        }
    }
</script>

<body>
	<%@ include file="./menu.jsp"%>
<%
	if(!isName) {
%>
	<script>
		alert("로그인이 필요합니다.");
		location.href="login.jsp"		
	</script>
<% 
	}
%>
	<%@ include file="dbconn.jsp"%>

	<div class="send-message">
		<div class="container" >
			<div  class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>내 정보</h2>
					</div>
				</div>

								
<%
                    // session의 mSeq통해 member  접근
                    
                    	int mSeq =(int)session.getAttribute("mSeq");
                    	

                    
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						
						try{String sql = "select * from member where mSeq = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1,mSeq);
						
						rs = pstmt.executeQuery();
						
						while (rs.next()){
							String mId = rs.getString("mId");
							String mName = rs.getString("mName");
							String mPhone = rs.getString("mPhone");
							String mAccount = rs.getString("mAccount");
							
						
						
							
					%>				
				
				
				
		<div class="row g-3">
            <div class="col-12">                
              <label for="ID" class="form-label"><strong>ID</strong></label>             	
              	<p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%= mId%></p>            
            </div>
            
            <div class="col-12">                
              <label for="Name" class="form-label"><strong>Name</strong></label>             	
              	<p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%= mName %></p>            
            </div>
            
            <div class="col-12">                
              <label for="Phone" class="form-label"><strong>Phone</strong></label>             	
              	<p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%= mPhone %></p>            
            </div>
            
            <div class="col-12">                
              <label for="Account" class="form-label"><strong>Account</strong></label>             	
              	<p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%= mAccount %></p>            
            </div>

            

            
               
            </div>
          </div>
          <%
						}
						}
						catch (SQLException ex){
							out.println("member 변수 호출 실패");
						}
                    
                    
                    %>
				

				
				
				
				
				

				<div class="col-md-12" margin-top:100px;>
					<div class="section-heading">
						<h2 >내가 참여한 공동구매</h2>



					</div>
				</div>


				<div class="products"> 
					<div class="container">
						<div class="row">


							<div class="col-md-12">
								<div class="filters-content">
									<div class="row grid" style="position: relative;">

										<%
						PreparedStatement pstmt2 = null;
						ResultSet rs2 = null;
						String sql = "select * from post where pSeq IN (select pSeq from attend where mSeq = ?)";
						pstmt2 = conn.prepareStatement(sql);
						// 원래 코드 
						pstmt2.setInt(1,mSeq);
						//밑은 테스트 코드
						//pstmt2.setInt(1,1);
						rs2 = pstmt2.executeQuery();
						String arranDiv = null;
						String pStatus = "";
						while (rs2.next()){
							int pSeq_style = rs2.getInt("pTotal")*100/rs2.getInt("pTarget");	
							
							if (rs2.getInt("pStatus") == 1) {
								arranDiv = "des";
								pStatus = "모집 중";
							} else if (rs2.getInt("pStatus") == 2) {
								arranDiv = "dev";
								pStatus = "모집 완료";
							}
							
					%>
										<div class="col-lg-4 col-md-4 all des <%=arranDiv %>"<%-- style="position: absolute; left: <%=rowposition%>%; top: <%=columnposition*384%>px;" --%>>
											<div class="product-item">
												<a href="product.jsp?pseq=<%=rs2.getInt("pSeq")%>"> <%-- <img src="<%=rs.getString("pImage") %>" width> --%>
													<img src="./images/<%=rs2.getString("pImage")%>"
													alt="Product Image" width="300" height="200">
													<div class="down-content">

														<h3><%=rs2.getString("pTitle")%></h3>
														<br>
														<h6><%=rs2.getInt("pPrice") %>원
														</h6>
														<%-- <p><%=rs.getString("pText") %></p> --%>
														<p style="font-weight: 500"><%=pStatus %></p>
														<div class="progress">
															<!-- width % 수정해서 progress-bar 달성도 조작 -->
															<%-- <%=Math.round(rs.getInt("pTotal")/rs.getInt("pTarget"))%> --%>
															<div class="progress-bar progress-bar-bgc"
																role="progressbar"
																style="width:<%=pSeq_style %>%"
																aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
												</a>
											</div>
										</div>
										<%
						}
					
					if (rs2 != null){
					rs2.close();
					}
					
					if (pstmt != null){
						pstmt.close();
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
				
				
				<div class="col-md-12">
					<div class="section-heading">
						<h2>내가 제안한 공동구매</h2>



					</div>
				</div>
				
				
				
				
				
				<div class="products">
					<div class="container">
						<div class="row">


							<div class="col-md-12">
								<div class="filters-content">
									<div class="row grid" style="position: relative;">

										<%
						PreparedStatement pstmt3 = null;
						ResultSet rs3 = null;
						String sql3 = "select * from post where mSeq = ?";
						pstmt3 = conn.prepareStatement(sql3);
						// 원래 코드 
						pstmt3.setInt(1,mSeq);
						//밑은 테스트 코드
						//pstmt2.setInt(1,1);
						rs3 = pstmt3.executeQuery();
						String arranDiv3 = null;
						pStatus = "";
						while (rs3.next()){
							
							int pSeq_style = rs3.getInt("pTotal")*100/rs3.getInt("pTarget");	
							if (rs3.getInt("pStatus") == 1) {
								arranDiv = "des";
								pStatus = "모집 중";
							} else if (rs3.getInt("pStatus") == 2) {
								arranDiv = "dev";
								pStatus = "모집 완료";
							}
							
					%>
										<div class="col-lg-4 col-md-4 all des <%=arranDiv %>"<%-- style="position: absolute; left: <%=rowposition%>%; top: <%=columnposition*384%>px;" --%>>
											<div class="product-item">
												<a href="product.jsp?pseq=<%=rs3.getInt("pSeq")%>"> <%-- <img src="<%=rs.getString("pImage") %>" width> --%>
													<img src="./images/<%=rs3.getString("pImage")%>"
													alt="Product Image" width="300" height="200">
													<div class="down-content">
													
														

														<h3><%=rs3.getString("pTitle")%></h3>
														<br>
														<h6><%=rs3.getInt("pPrice") %>원
														</h6>
														<%-- <p><%=rs.getString("pText") %></p> --%>
															
														<p style="font-weight: 500"><%=pStatus %></p>
																	
																
														<a href = "completeProducts.jsp?pSeq=<%=rs3.getInt("pSeq") %>"  class="filled-button"  style="margin:10px">완료 처리</a>
																
														
														<div class="progress">
															<!-- width % 수정해서 progress-bar 달성도 조작 -->
															<%-- <%=Math.round(rs.getInt("pTotal")/rs.getInt("pTarget"))%> --%>
															<div class="progress-bar progress-bar-bgc"
																role="progressbar"
																style="width:<%=pSeq_style %>%"
																 aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
												</a>
											</div>
										</div>
										<%
						}
					
					if (rs3 != null){
					rs3.close();
					}
					
					if (pstmt3 != null){
						pstmt3.close();
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



















				<div class="container" style="margin-top: 60px;">
					<hr>
					<jsp:include page="footer.jsp" />
				</div>
</body>
</html>