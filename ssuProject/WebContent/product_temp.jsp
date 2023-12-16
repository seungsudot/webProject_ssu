<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="./menu.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="./assets/css/custom.css">
    <title>Product</title>
    <%
    	int mSeq = -1;
    	boolean alreadyAttend = false;
    	if(isName) {
    		mSeq = (int)session.getAttribute("mSeq");
    	}
    %>
    <script>
        var productId = <%= request.getParameter("pseq") %>;
        var isName = <%= isName %>;
        var bool = <%= alreadyAttend %>;

        function showConfirmation() {
        	
        	
            	var result = confirm("참여하시겠습니까?(신중한 선택 부탁드립니다.)" + bool);
            	if (result) {
            		if(!isName) {
						alert("로그인이 필요합니다.");
						location.href="login.jsp";
            		}else {
                		location.href = "product.jsp?pseq=" + productId + "&update=true";
            	}
            }
       	 }
        
        </script>
    </head>
    <body>
        
        <div class="best-features about-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading"><h2>제품 상세 정보</h2></div>
                    </div>
                    <div class="col-md-6">
                        <%@ include file ="dbconn.jsp" %>
                        <%
                            int productId = Integer.parseInt(request.getParameter("pseq"));
                            boolean updateTotal = Boolean.parseBoolean(request.getParameter("update"));

                            if (updateTotal) {
                                try {
                                	
                                	if (mSeq != -1){
                                		String isThatme = "select * from attend where mSeq =? and pseq =?";
                                		PreparedStatement pstmt = conn.prepareStatement(isThatme);
                                		pstmt.setInt(1,mSeq);
                                		pstmt.setInt(2,productId);
                                		
                                		ResultSet rs = pstmt.executeQuery();
                                		
                                		while(rs.next()) {
                                			alreadyAttend = true;
                                		}
                                		if (rs != null)
                                			rs.close();
                                		if (pstmt != null)
                                			pstmt.close();
                                		
                                	}
                                	
                                	
                                	
                                    String checkGoalSql = "SELECT pTotal, pTarget FROM post WHERE pSeq=?";
                                    try (PreparedStatement checkGoalStmt = conn.prepareStatement(checkGoalSql)) {
                                        checkGoalStmt.setInt(1, productId);
                                        try (ResultSet checkGoalRs = checkGoalStmt.executeQuery()) {
                                            if (checkGoalRs.next()) {
                                                int pTotal = checkGoalRs.getInt("pTotal");
                                                int pTarget = checkGoalRs.getInt("pTarget");
                                                
                                   
                                                if (pTotal < pTarget) {
                                                    String updateSql = "UPDATE post SET pTotal = COALESCE(pTotal, 0) + 1 WHERE pSeq=?"; //NULL 방지용 COALESCE(pTotal, 0)
                                                    try (PreparedStatement pstmt = conn.prepareStatement(updateSql)) {
                                                        pstmt.setInt(1, productId);
                                                        pstmt.executeUpdate();
                                                    }
                                                    
                                                    //현황이랑 목표가 같아지면 완료로 바꿔주기
                                                    if (pTotal + 1 == pTarget) {
                                                        String updateStatusSql = "UPDATE post SET pStatus = 2 WHERE pSeq=?";
                                                        try (PreparedStatement pstmtStatus = conn.prepareStatement(updateStatusSql)) {
                                                            pstmtStatus.setInt(1, productId);
                                                            pstmtStatus.executeUpdate();
                                                        }
                                                    }
                                                    
                                                } else {
                                                	out.println("<script>alert('이미 목표 달성이 완료된 공동구매입니다!');</script>");
                                                }
                                            }
                                        }
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }

                            String sql = "SELECT * FROM post WHERE pSeq=?";
                            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                                pstmt.setInt(1, productId);
                                try (ResultSet rs = pstmt.executeQuery()) {
                                    if (rs.next()) {
                        %>
                        <div class="right-image">
                            <img src="./images/<%=rs.getString("pImage")%>" alt="Product Image" width="300" height="300">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <h2 style="color:#4A4A4A; margin-bottom:20px;"><%=rs.getString("pTitle")%></h2>
                            <h4>가격 <p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%=rs.getInt("pPrice")%>원</p></h4>
                            <h4>설명 <p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%=rs.getString("pText")%></p></h4>
                            <h4>상품 구매 사이트 <p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%=rs.getString("pUrl")%></p></h4>
                            <h4>진행 상황 <p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%=rs.getInt("pTotal")%>/<%=rs.getInt("pTarget")%></p></h4>
                        </div>
                        
                        <div class="col-lg-12">
                                <a onclick="showConfirmation()" class="filled-button" style="font-weight: 400">공동구매 참여</a>
                        </div>
                       
                    </div>
                </div>
                <%
                    } else {
                %>
                    <p>상품이 존재하지 않습니다.</p>
                <%
                                    }
                                }
                            }
                    %>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 60px;">
            <hr>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
    </html>
