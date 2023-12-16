<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
<title>Product</title>
<% boolean isFull = false; %>
<script>
   var productId = <%= request.getParameter("pseq") %>;
   var isFull = <%= isFull %>;

   function showConfirmation() {
	   if(isFull) {
		   alert("이미 참여인원이 모두 충족하여 참여할 수 없습니다.");
		   return;
	   }
        var result = confirm("참여하시겠습니까?(신중한 선택 부탁드립니다.)");
        if (result) {
            window.location.href = "apply.jsp?pseq=" + productId;
        } else {
            
        }
    }
</script>
</head>
<body>
    <%@ include file="./menu.jsp" %>
    
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
                       PreparedStatement pstmt = null;
                       ResultSet rs = null;
                       String sql = "SELECT * FROM post WHERE pSeq=?";
                       pstmt = conn.prepareStatement(sql);
                       pstmt.setInt(1, productId);
                       rs = pstmt.executeQuery();
   
                       if (rs.next()) {
                    	   int pTotal = rs.getInt("pTotal");
                    	   int pTarget = rs.getInt("pTarget");
                    	   if(pTotal == pTarget)
                    		   isFull = true;
                    	   
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
                      <h4>진행 상황 <p style="font-size: 20px; margin-top:5px; padding-bottom: 10px;"><%=pTotal%>/<%=pTarget%></p></h4>
                  </div>
                   <div class="col-lg-12">
                         <a onclick="showConfirmation()" class="filled-button">공구 참여</a>
                   </div>
               </div>
              <%
                  } else {
              %>
                  <p>상품이 존재하지 않습니다.</p>
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
<div class="container" style="margin-top: 60px;">
   <hr>
   <jsp:include page="footer.jsp" />
</div>
</body>
</html>